//!HOOK MAIN
//!BIND HOOKED
//!DESC GammaChange

#define GammaFactor 2.0 // Change this value to adjust the gamma

/* A lightweight gamma correction shader for mpv / libplacebo
hook: MAIN, OUTPUT
*/

vec4 hook(){ 
    vec4 color = HOOKED_texOff(0);
    color.rgb = clamp(pow(color.rgb, vec3(1.0/GammaFactor)), 0, 1);
    return color;
}
