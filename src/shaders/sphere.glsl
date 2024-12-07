#version 330 core

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
layout(rgba32f, binding = 0) uniform image2D screen;

void main(){
    vec4 pixel = vec4(0.075, 0.133, 0.173, 1.0);
	ivec2 pixel_coords=ivec2(gl_LocalInvocationID.xy);

	ivec2 dims = imageSize(screen);
	float x = 0;
	float y = 0;

	float fov = 90.0;
	vec3 cam_o = vec3(0.0,0.0,-tan(fov/2.0));
	vec3 ray_o = vec3(x, y, 0.0);
	vec3 ray_d = normalize(ray_o - cam_o);

	vec3 sphere_c = vec3(0.0,0.0,-5.0);
	float sphere_r = 1.0;

	vec3 o_c = ray_o - sphere_c;
	float b = dot(ray_d, o_c);
	float c = dot(o_c,o_c) - sphere_r * sphere_r;
	float interState = b * b - c;
	vec3 inter = ray_o + ray_d*(-b+sqrt(b*b -c));

	if (interState >= 0.0){
		pixel = vec4(normalize(inter - sphere_c)+1.0/2.0, 1.0);
	}
	imageStore(screen, pixel_coords, pixel);
}