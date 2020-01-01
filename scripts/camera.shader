shader_type canvas_item;

uniform float vignette_scale;

void fragment() {
  vec3 col = texture(TEXTURE, UV).xyz;
  float dist_to_center = length(SCREEN_UV - 0.5) * -2.0 + 1.0 * vignette_scale;
  COLOR.xyz = col * dist_to_center;
}