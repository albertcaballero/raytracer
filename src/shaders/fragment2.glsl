#version 330 core
out vec4 FragColor;

uniform vec3 center;
uniform float radius;

void main() {
	vec3 cameraPos = vec3(0.0,0.0, -1.0);
    // Calculate ray direction
    vec2 fragCoord = gl_FragCoord.xy;
    vec2 screenPos = fragCoord / vec2(800.0, 600.0) * 2.0 - 1.0;
    vec3 rayDir = normalize(vec3(screenPos, -1.0));

    // Ray-sphere intersection
    vec3 oc = cameraPos - center;
    float a = dot(rayDir, rayDir);
    float b = 2.0 * dot(oc, rayDir);
    float c = dot(oc, oc) - radius * radius;
    float discriminant = b * b - 4.0 * a * c;

    if (discriminant > 0.0) {
        // float t = (-b - sqrt(discriminant)) / (2.0 * a);
        // vec3 hitPoint = cameraPos + t * rayDir;
        // vec3 normal = normalize(hitPoint - center);
        // vec3 lightDir = normalize(vec3(1.0, 1.0, -1.0));
        // float brightness = max(dot(normal, lightDir), 0.0);
        // FragColor = vec4(vec3(brightness), 1.0);
		FragColor = vec4(0.0, 1.0, 1.0, 1.0);
    } else {
        FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }
}