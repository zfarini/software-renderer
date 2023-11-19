#ifndef SIMD_H
#define SIMD_H

#include <immintrin.h>

#define LANE_WIDTH 8

struct f32_8x
{
    __m256 v;
};

struct u32_8x
{
    __m256i v;
};

struct v2_8x
{
    f32_8x x;
    f32_8x y;
};

struct v3_8x
{
    f32_8x x;
    f32_8x y;
    f32_8x z;
};

internal u32_8x LaneU32(int x)
{
    u32_8x res;

    res.v = _mm256_set1_epi32(x);
    return res;
}

internal u32_8x LaneU32(__m256i v)
{
    u32_8x res;

	res.v = v;
    return res;
}

internal u32_8x LaneU32(f32_8x x)
{
    u32_8x res;

    res.v = _mm256_cvttps_epi32(x.v);
    return res;
}

internal u32_8x LaneU32(int x0, int x1, int x2, int x3, int x4, int x5, int x6, int x7)
{
    u32_8x res;

    res.v = _mm256_set_epi32(x7, x6, x5, x4, x3, x2, x1, x0);
    return res;
}

internal u32_8x operator+(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_add_epi32(a.v, b.v);
    return res;
}

internal u32_8x operator-(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_sub_epi32(a.v, b.v);
    return res;
}

internal u32_8x operator*(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_mullo_epi32(a.v, b.v);
    return res;
}

internal u32_8x operator*(u32_8x a, int x)
{
    return a * LaneU32(x);
}

internal u32_8x operator*(int x, u32_8x a)
{
	return a * x;
}

internal u32_8x operator>>(u32_8x a, int shift)
{
    u32_8x res;

    res.v = _mm256_srli_epi32(a.v, shift);
    return res;
}

internal u32_8x operator&(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_and_si256(a.v, b.v);
    return res;
}

internal u32_8x operator&(u32_8x a, int value)
{
    return a & LaneU32(value);
}

internal u32_8x operator|(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_or_si256(a.v, b.v);
    return res;
}

internal u32_8x operator^(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_xor_si256(a.v, b.v);
    return res;
}

internal u32_8x operator<<(u32_8x a, int shift)
{
    u32_8x res;

    res.v = _mm256_slli_epi32(a.v, shift);
    return res;
}

internal u32_8x min(u32_8x a, u32_8x b)
{
	u32_8x res;

	res.v = _mm256_min_epi32(a.v, b.v);
	return res;
}

internal u32_8x max(u32_8x a, u32_8x b)
{
	u32_8x res;

	res.v = _mm256_max_epi32(a.v, b.v);
	return res;
}

internal u32_8x operator>(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_cmpgt_epi32(a.v, b.v);

    return res;
}

internal u32_8x operator==(u32_8x a, u32_8x b)
{
    u32_8x res;

    res.v = _mm256_cmpeq_epi32(a.v, b.v);

    return res;
}

internal u32_8x operator>=(u32_8x a, u32_8x b)
{
	return (a > b)|(a == b);
}

internal u32_8x operator!(u32_8x a)
{
	u32_8x res;

	res.v = _mm256_andnot_si256(a.v, LaneU32(0xffffffff).v);
	return res;
}

internal u32_8x operator<(u32_8x a, u32_8x b)
{
	return !(a >= b);
}

internal u32_8x blend(u32_8x a, u32_8x b, u32_8x mask)
{
	u32_8x res;

	res.v = _mm256_blendv_epi8(a.v, b.v, mask.v);
	return res;
}

// f32_8x
internal f32_8x LaneF32(float x)
{
    f32_8x res;

    res.v = _mm256_set1_ps(x);
    return res;
}

internal f32_8x LaneF32(u32_8x x)
{
    f32_8x res;

    res.v = _mm256_cvtepi32_ps(x.v);
    return res;
}

internal f32_8x LaneF32(__m256 x)
{
    f32_8x res;

    res.v = x;
    return res;
}

internal f32_8x LaneF32(float x7, float x6, float x5, float x4, float x3, float x2, float x1, float x0)
{
    f32_8x res;

    res.v = _mm256_set_ps(x7, x6, x5, x4, x3, x2, x1, x0);
    return res;
}

internal f32_8x operator+(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_add_ps(a.v, b.v);
    return res;
}

internal f32_8x operator-(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_sub_ps(a.v, b.v);
    return res;
}

internal f32_8x operator*(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_mul_ps(a.v, b.v);
    return res;
}

internal f32_8x operator*(f32_8x a, float b)
{
    return a * LaneF32(b);
}

internal f32_8x operator*(float b, f32_8x a)
{
    return a * b;
}

internal f32_8x operator/(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_div_ps(a.v, b.v);
    return res;
}

internal f32_8x operator/(f32_8x a, float b)
{
    f32_8x res;

    res = a / LaneF32(b);
    return res;
}

internal f32_8x operator-(f32_8x a)
{
    return a * (-1);
}

internal f32_8x &operator+=(f32_8x &a, f32_8x b)
{
    return a = a + b;
}

internal f32_8x &operator-=(f32_8x &a, f32_8x b)
{
    return a = a - b;
}

internal f32_8x &operator*=(f32_8x &a, f32_8x b)
{
    return a = a * b;
}

internal f32_8x &operator*=(f32_8x &a, float b)
{
    return a = a * b;
}

internal f32_8x &operator/=(f32_8x &a, f32_8x b)
{
    return a = a / b;
}

internal f32_8x &operator/=(f32_8x &a, float b)
{
    return a = a / b;
}

internal u32_8x operator<(f32_8x a, f32_8x b)
{
    u32_8x res;

    res.v = _mm256_castps_si256(_mm256_cmp_ps(a.v, b.v, _CMP_LT_OS));

    return res;
}

internal u32_8x operator>(f32_8x a, f32_8x b)
{
    u32_8x res;

    res.v = _mm256_castps_si256(_mm256_cmp_ps(a.v, b.v, _CMP_GT_OS));

    return res;
}

internal u32_8x operator>=(f32_8x a, f32_8x b)
{
    u32_8x res;

    res.v = _mm256_castps_si256(_mm256_cmp_ps(a.v, b.v, _CMP_GE_OS));

    return res;
}

internal u32_8x operator<=(f32_8x a, f32_8x b)
{
    u32_8x res;

    res.v = _mm256_castps_si256(_mm256_cmp_ps(a.v, b.v, _CMP_LE_OS));

    return res;
}

internal u32_8x operator==(f32_8x a, f32_8x b)
{
    u32_8x res;

    res.v = _mm256_castps_si256(_mm256_cmp_ps(a.v, b.v, _CMP_EQ_OS));

    return res;
}

internal f32_8x sqrt(f32_8x x)
{
    f32_8x res;

    res.v = _mm256_sqrt_ps(x.v);
    return res;
}

internal f32_8x rsqrt(f32_8x x)
{
    f32_8x res;

    res.v = _mm256_rsqrt_ps(x.v);
    return res;
}

internal f32_8x blend(f32_8x a, f32_8x b, u32_8x mask)
{
	f32_8x res;

	res.v = _mm256_blendv_ps(a.v, b.v, _mm256_castsi256_ps(mask.v));
	return res;
}

internal f32_8x lerp(f32_8x a, f32_8x t, f32_8x b)
{
	return (LaneF32(1) - t) * a + t * b;
}

internal f32_8x max(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_max_ps(a.v, b.v);
    return res;
}

internal f32_8x min(f32_8x a, f32_8x b)
{
    f32_8x res;

    res.v = _mm256_min_ps(a.v, b.v);
    return res;
}

// lane v2
internal v2_8x LaneV2(f32_8x x, f32_8x y)
{
    v2_8x res;

    res.x = x;
    res.y = y;
    return res;
}

internal v2_8x operator+(v2_8x a, v2_8x b)
{
    v2_8x res;

    res.x = a.x + b.x;
    res.y = a.y + b.y;

    return res;
}

internal v2_8x operator-(v2_8x a, v2_8x b)
{
    v2_8x res;

    res.x = a.x - b.x;
    res.y = a.y - b.y;

    return res;
}

internal v2_8x operator*(v2_8x a, v2_8x b)
{
    v2_8x res;

    res.x = a.x * b.x;
    res.y = a.y * b.y;

    return res;
}

internal v2_8x operator*(f32_8x a, v2 b)
{
	v2_8x res;

	res.x = a * b.x;
	res.y = a * b.y;

	return res;
}

internal v2_8x operator*(v2 b, f32_8x a)
{
	return a * b;
}

// Lane V3
internal v3_8x operator+(v3_8x a, v3_8x b)
{
    v3_8x res;

    res.x = a.x + b.x;
    res.y = a.y + b.y;
    res.z = a.z + b.z;
    return res;
}

internal v3_8x operator-(v3_8x a, v3_8x b)
{
    v3_8x res;

    res.x = a.x - b.x;
    res.y = a.y - b.y;
    res.z = a.z - b.z;
    return res;
}
    
internal v3_8x operator*(v3_8x a, v3_8x b)
{
    v3_8x res;

    res.x = a.x * b.x;
    res.y = a.y * b.y;
    res.z = a.z * b.z;
    return res;
}

internal v3_8x operator*(v3_8x a, float b)
{
    v3_8x res;

    res.x = a.x * b;
    res.y = a.y * b;
    res.z = a.z * b;
    return res;
}

internal v3_8x operator*(float b, v3_8x a)
{
    return a * b;
}

internal v3_8x operator/(v3_8x a, v3_8x b)
{
    v3_8x res;

    res.x = a.x / b.x;
    res.y = a.y / b.y;
    res.z = a.z / b.z;
    return res;
}

internal v3_8x operator/(v3_8x a, float b)
{
    v3_8x res;

    res.x = a.x / b;
    res.y = a.y / b;
    res.z = a.z / b;
    return res;
}

internal v3_8x operator*(v3 v, f32_8x l)
{
    v3_8x res;

    res.x = l * v.x;
    res.y = l * v.y;
    res.z = l * v.z;

    return res;
}

internal v3_8x operator*(f32_8x l, v3 v)
{
    return v * l;
}

internal v3_8x operator*(v3_8x a, v3 b)
{
    v3_8x res;

    res.x = a.x * b.x;
    res.y = a.y * b.y;
    res.z = a.z * b.z;

    return res;
}

internal v3_8x operator*(v3 b, v3_8x a)
{
    return a * b;
}

internal v3_8x operator*(v3_8x a, f32_8x b)
{
	v3_8x res;

	res.x = a.x * b;
	res.y = a.y * b;
	res.z = a.z * b;
	return res;
}

internal v3_8x operator*(f32_8x b, v3_8x a)
{
	return a * b;
}

internal v3_8x LaneV3(v3 v)
{
    v3_8x res;

    res.x = LaneF32(v.x);
    res.y = LaneF32(v.y);
    res.z = LaneF32(v.z);
    return res;
}

internal v3_8x &operator+=(v3_8x &a, v3_8x b)
{
    return a = a + b;
}

internal v3_8x &operator-=(v3_8x &a, v3_8x b)
{
    return a = a - b;
}

internal v3_8x &operator*=(v3_8x &a, v3_8x b)
{
    return a = a * b;
}

internal v3_8x &operator/=(v3_8x &a, v3_8x b)
{
    return a = a / b;
}

internal v3_8x &operator*=(v3_8x &a, f32_8x b)
{
    return a = a * b;
}

internal v3_8x LaneV3(f32_8x x, f32_8x y, f32_8x z)
{
	return v3_8x{x, y, z};
}

internal v3_8x LaneV3(u32_8x x, u32_8x y, u32_8x z)
{
	return v3_8x{LaneF32(x), LaneF32(y), LaneF32(z)};
}

internal v3_8x LaneV3(f32_8x a)
{
    v3_8x res;

    res.x = res.y = res.z = a;
    return res;
}

internal f32_8x length(v3_8x v)
{
    return sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
}

internal v3_8x noz(v3_8x v)
{
    f32_8x one_over_length = rsqrt(v.x * v.x + v.y * v.y + v.z * v.z);

    v.x *= one_over_length;
    v.y *= one_over_length;
    v.z *= one_over_length;

    return v;
}

internal f32_8x dot(v3_8x a, v3_8x b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

internal v3_8x color_u32_8x_to_v3_8x(u32_8x color)
{
	v3_8x res;

	res.x = LaneF32((color >> 24) & 0xFF) / 255.f;
	res.y = LaneF32((color >> 16) & 0xFF) / 255.f;
	res.z = LaneF32((color >> 8)  & 0xFF) / 255.f;

	return res;
}

internal v3_8x lerp(v3_8x a, f32_8x t, v3_8x b)
{
	v3_8x res;

	f32_8x one_minus_t = LaneF32(1) - t;

	res.x = one_minus_t * a.x + t * b.x;
	res.y = one_minus_t * a.y + t * b.y;
	res.z = one_minus_t * a.z + t * b.z;
	return res;
}

internal float _mm_hsum_ps(__m128 v) {
	v = _mm_hadd_ps(v, v);
	v = _mm_hadd_ps(v, v);
    return        _mm_cvtss_f32(v);
}

internal float get128_avx(__m128i a, int idx){
    __m128i vidx = _mm_cvtsi32_si128(idx);          // vmovd
    __m128  shuffled = _mm_permutevar_ps(a, vidx);  // vpermilps
    return _mm_cvtss_f32(shuffled);
}

internal float horizontal_min( __m256 v )
{
    __m128 i = _mm256_extractf128_ps( v, 1 );
    i = _mm_min_ps( i, _mm256_castps256_ps128( v ) );
    i = _mm_min_ps( i, _mm_movehl_ps( i, i ) );
    i = _mm_min_ss( i, _mm_movehdup_ps( i ) );
    return _mm_cvtss_f32( i );
}

internal float horizontal_max( __m256 v )
{
    __m128 i = _mm256_extractf128_ps( v, 1 );
    i = _mm_max_ps( i, _mm256_castps256_ps128( v ) );
    i = _mm_max_ps( i, _mm_movehl_ps( i, i ) );
    i = _mm_max_ss( i, _mm_movehdup_ps( i ) );
    return _mm_cvtss_f32( i );
}

#if 0
intenral float horizontal_min_avx(__m256 v) {
    __m256 permute1 = _mm256_permute2f128_ps(v, v, 0x01); // Permute the high and low 128-bit lanes
    __m256 min1 = _mm256_min_ps(v, permute1); // Compute minimum within the two 128-bit halves
    
    __m256 permute2 = _mm256_permute_ps(min1, _MM_SHUFFLE(1, 0, 3, 2)); // Shuffle for cross-lane comparison
    __m256 min2 = _mm256_min_ps(min1, permute2); // Minimum across lanes
    
    __m256 permute3 = _mm256_permute2f128_ps(min2, min2, 0x01); // Permute high and low 128-bit lanes
    __m256 min3 = _mm256_min_ps(min2, permute3); // Final minimum across all elements
    
    return _mm256_cvtss_f32(_mm256_castps256_ps128(min3)); // Extract the final minimum value
}

internal float horizontal_max_avx(__m256 v) {
    __m256 permute1 = _mm256_permute2f128_ps(v, v, 0x01); // Permute the high and low 128-bit lanes
    __m256 min1 = _mm256_max_ps(v, permute1); // Compute minimum within the two 128-bit halves
    
    __m256 permute2 = _mm256_permute_ps(min1, _MM_SHUFFLE(1, 0, 3, 2)); // Shuffle for cross-lane comparison
    __m256 min2 = _mm256_max_ps(min1, permute2); // Minimum across lanes
    
    __m256 permute3 = _mm256_permute2f128_ps(min2, min2, 0x01); // Permute high and low 128-bit lanes
    __m256 min3 = _mm256_max_ps(min2, permute3); // Final minimum across all elements
    
    return _mm256_cvtss_f32(_mm256_castps256_ps128(min3)); // Extract the final minimum value
}
#endif

#endif
