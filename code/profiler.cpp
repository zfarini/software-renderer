/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   profiler.cpp                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: zfarini <zfarini@student.1337.ma>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/13 19:39:30 by zfarini           #+#    #+#             */
/*   Updated: 2023/11/13 20:10:43 by zfarini          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

	
void update_profiler_stats(Game *game)
{
    if (game->profiler_paused)
        return ;

	game->last_frame_times[game->curr_profiler_frame] = game->last_frame_time;

	TimedBlockData *last_timed_blocks = timed_blocks == timed_blocks1 ? timed_blocks2 : timed_blocks1;

	TimedBlockStat *stats = game->timed_blocks_stats;

	for (int bid = 0; bid < MAX_BLOCK_COUNT; bid++)
	{
		stats[bid].block_id = bid;
	    for (int tid = 0; tid < THREAD_COUNT; tid++)
	    {
	    	// remove old stats
	    	TimedBlockData *record = &game->timed_blocks_record[game->curr_profiler_frame][tid][bid];
	    	if (record->calls_count)
	    	{
	    		stats[bid].t_cycle_count[tid] -= record->cycle_count;
	    		stats[bid].t_childs_cycle_count[tid] -= record->childs_cycle_count;
	    		stats[bid].t_calls_count[tid] -= record->calls_count;
	    		stats[bid].t_cycles_per_call[tid] -= (double)record->cycle_count / record->calls_count;
	    		stats[bid].cycle_count -= record->cycle_count;
	    		stats[bid].childs_cycle_count -= record->childs_cycle_count;
	    		stats[bid].calls_count -= record->calls_count;
	    		stats[bid].cycles_per_call -= (double)record->cycle_count / record->calls_count;
	    	}

	    	record = &last_timed_blocks[tid * MAX_BLOCK_COUNT + bid];

	    	game->timed_blocks_record[game->curr_profiler_frame][tid][bid] = *record;
	    	// add new stats
	    	if (record->calls_count)
	    	{
	    		stats[bid].t_cycle_count[tid] += record->cycle_count;
	    		stats[bid].t_childs_cycle_count[tid] += record->childs_cycle_count;
	    		stats[bid].t_calls_count[tid] += record->calls_count;
	    		stats[bid].t_cycles_per_call[tid] += (double)record->cycle_count / record->calls_count;
	    		stats[bid].cycle_count += record->cycle_count;
	    		stats[bid].childs_cycle_count += record->childs_cycle_count;
	    		stats[bid].calls_count += record->calls_count;
	    		stats[bid].cycles_per_call += (double)record->cycle_count / record->calls_count;
	    	}

	    	if (record->filename)
	    		stats[bid].data = record;
	    }
	}
}

void draw_profiler(Game *game, GameInput *game_input, Render_Context *r,
                    v2 p, v2 dim)
{
    if (!game->show_profiler || !game->frame)
        return ;

    // TODO: this is wrong at the start if we pause, it shouldn't use the game->frame
    int record_count = game->profiler_record_count;

	TimedBlockData *last_timed_blocks = timed_blocks == timed_blocks1 ? timed_blocks2 : timed_blocks1;

	TimedBlockStat stats[MAX_BLOCK_COUNT];
	memcpy(stats, game->timed_blocks_stats, sizeof(stats));

    f32 y = p.y;

    r->enable_clip_rect = 1;
    r->clip_rect_min = p;
    r->clip_rect_max = r->clip_rect_min + dim;

	v2 mouse_p = game_input->mouse_p;

    push_2d_rect(r, p, p + dim, V4(0, 0, 0, 0.8));
	{
		char s[512];
	
		f32 frame_time = 0;
	
		if (game->profiler_paused)
			frame_time = game->last_frame_times[game->profiler_watch_frame];
        else
        {
            for (int i = 0; i < record_count; i++)
                frame_time += game->last_frame_times[i];
            frame_time /= record_count;
        }
	
		snprintf(s, sizeof(s), "%.2fms %dfps %d records", frame_time,
				(int)(1000.f / frame_time), record_count);
		push_2d_text(r, cstring(s), V2(p.x, y));
        y += game->text_dy;
	}

	f32 frame_time_height = game->text_dy * 3;
	for (int i = 0; i < PROFILER_RECORD_FRAMES; i++)
	{
		f32 dx = game->text_dx * 0.6;

		dx = (dim.x / PROFILER_RECORD_FRAMES) * 0.9;

		f32 h = game->last_frame_times[i] / (1000.f / 60);

		v4 color = V4(h, 0, 0, 1);

		if (h > 1)
			h = 1;


		f32 max_y = y + frame_time_height;

		v2 min = V2(p.x + i * dx, max_y - h * frame_time_height);
		v2 max = V2(min.x + dx, max_y);

		if (mouse_p.x >= min.x && mouse_p.x < max.x
				&& mouse_p.y >= min.y && mouse_p.y < max.y
				&& !game_input->mouse_relative_mode)
		{
			color = V4(0, 1, 1, 1);
			if (game_input->mouse_buttons[MouseButton_Left].is_down
					&& !game_input->mouse_buttons[MouseButton_Left].was_down)
			{
                game->profiler_paused = 1;
				game->profiler_watch_frame = i;
			}
		}
		else if (i == game->curr_profiler_frame)
			color = V4(1, 1, 0, 1);
        if (game->profiler_paused && i == game->profiler_watch_frame)
			color = V4(0, 1, 0, 1);
		push_2d_rect(r, min, max, color);
		push_2d_rect_outline(r, min, max, V4(0.5, 0.5, 0.5, 1));
	}
	y += frame_time_height + game->text_dy * 0.5f;

    {
        f32 offy = game->text_dy * 0.3;

        v2 min = V2(p.x, y);
        v2 max = V2(min.x + 5 * game->text_dx, y + game->text_dy + offy * 2);
        push_2d_rect(r, min, max, V4(0, 0, 0, 1));

        v4 color = V4(0.7, 0.7, 0.7, 1);
        if (mouse_p.x >= min.x && mouse_p.x < max.x && mouse_p.y >= min.y && mouse_p.y < max.y)
        {
            color = V4(1, 1, 1, 1);
			if (game_input->mouse_buttons[MouseButton_Left].is_down
					&& !game_input->mouse_buttons[MouseButton_Left].was_down)
            {
                game->profiler_paused = !game->profiler_paused;
                if (game->profiler_paused)
                    game->profiler_watch_frame = game->curr_profiler_frame;
            }
        }
        push_2d_text(r, cstring("pause"), V2(p.x, y + offy), color);

        y += game->text_dy + 3 * offy;
    }

	double total_cycle_count = 0;

	if (game->profiler_paused)
	{
		for (int bid = 0; bid < MAX_BLOCK_COUNT; bid++)
		{
			memset(&stats[bid], 0, sizeof(stats[bid]));

			stats[bid].block_id = bid;
			for (int tid = 0; tid < THREAD_COUNT; tid++)
			{
				// remove old stats
				TimedBlockData *record = &game->timed_blocks_record[game->profiler_watch_frame][tid][bid];
				if (record->calls_count)
				{
					stats[bid].t_cycle_count[tid] += record->cycle_count - record->childs_cycle_count;
					stats[bid].t_childs_cycle_count[tid] += record->childs_cycle_count;
					stats[bid].t_calls_count[tid] += record->calls_count;
					stats[bid].t_cycles_per_call[tid] += (double)record->cycle_count / record->calls_count;
					stats[bid].cycle_count += record->cycle_count - record->childs_cycle_count;
					stats[bid].childs_cycle_count += record->childs_cycle_count;
					stats[bid].calls_count += record->calls_count;
					stats[bid].cycles_per_call += (double)record->cycle_count / record->calls_count;
				}
				if (record->filename)
					stats[bid].data = record;
			}
			total_cycle_count += stats[bid].cycle_count;
		}
	}
	else
	{
		for (int i = 0; i < MAX_BLOCK_COUNT; i++)
		{
			TimedBlockStat *stat = &stats[i];

			stat->childs_cycle_count /= record_count;
			stat->cycle_count /= record_count;
			stat->calls_count /= record_count;
			stat->cycles_per_call /= record_count;
			stat->cycle_count -= stat->childs_cycle_count;
			total_cycle_count += stat->cycle_count;
			for (int tid = 0; tid < THREAD_COUNT; tid++)
			{
				stat->t_childs_cycle_count[tid] /= record_count;
				stat->t_cycle_count[tid] /= record_count;
				stat->t_calls_count[tid] /= record_count;
				stat->t_cycles_per_call[tid] /= record_count;
				stat->t_cycle_count[tid] -= stat->t_childs_cycle_count[tid];
			}
		}
	}
	// sort by cycle_count
	for (int i = 0; i < MAX_BLOCK_COUNT; i++)
	{
		for (int j = 0; j < MAX_BLOCK_COUNT -  1; j++)
		{
			if (stats[j].cycle_count < stats[j + 1].cycle_count)
			{
				TimedBlockStat temp = stats[j];
				stats[j] = stats[j + 1];
				stats[j + 1] = temp;
			}
		}
	}
	for (int i = 0; i < MAX_BLOCK_COUNT; i++)
	{
		TimedBlockStat *stat = &stats[i];
		TimedBlockData *data = stat->data;

		if (!data)
			continue ;

		push_2d_text(r, V2(p.x, y), "%5.2lf%% %10.0lfcy %5.0lfh %s (%s:%d)",
				100 * (stat->cycle_count / total_cycle_count),
                stat->cycle_count,
                stat->calls_count,
                data->block_name,
                data->filename,
                data->line
				);
		y += game->text_dy;

		int thread_hit_count = 0;
		for (int tid = 0; tid < THREAD_COUNT; tid++)
		{
			if (stat->t_cycle_count[tid] > 0)
				thread_hit_count++;
		}
		if (thread_hit_count > 1)
		{
			for (int tid = 0; tid < THREAD_COUNT; tid++)
			{
				if (!stat->t_cycle_count[tid])
					continue ;

                push_2d_text(r, V2(p.x + game->text_dx * 3, y), "%5.2lf%% %10.0lfcy %5.0lfh tid:%d",
				    100 * (stat->t_cycle_count[tid] / stat->cycle_count),
                    stat->t_cycle_count[tid],
                    stat->t_calls_count[tid],
                    tid
				);
				y += game->text_dy;
			}
		}
        game->last_profiler_height = y;
	}
    r->enable_clip_rect = 0;
}

void end_profiling(Game *game)
{
	timed_blocks = timed_blocks == timed_blocks1 ? timed_blocks2 : timed_blocks1;

	for (int i = 0; i < MAX_BLOCK_COUNT; i++)
	{
		for (int j = 0; j < THREAD_COUNT; j++)
		{
			TimedBlockData *d = &timed_blocks[j * MAX_BLOCK_COUNT + i];

			d->cycle_count = 0;
			d->childs_cycle_count = 0;
			d->calls_count = 0;
		}
	}
    if (!game->profiler_paused && game->frame)
	    game->curr_profiler_frame = (game->curr_profiler_frame + 1) % PROFILER_RECORD_FRAMES;
    if (!game->profiler_paused)
        game->profiler_record_count = min(PROFILER_RECORD_FRAMES, game->profiler_record_count + 1);
}
