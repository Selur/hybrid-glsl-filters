//!HOOK MAIN
//!BIND HOOKED
//!DESC RGBAdjust

// Scaling factors for each color channel
#define RedScale 1.0
#define GreenScale 1.0
#define BlueScale 1.0

// Bias adjustments for each color channel (8-bit scale)
#define RedBias 0.0
#define GreenBias 0.0
#define BlueBias 0.0

// Gamma adjustments for each color channel (> 1 brightens, < 1 darkens)
#define RedGamma 1.0
#define GreenGamma 1.0
#define BlueGamma 1.0

/* A comprehensive RGB adjustment shader for mpv
   Same order as AviSynth's RGBAdjust: scale, add bias, clip, apply gamma
   v0.2
*/

vec4 hook(){
    vec4 color = HOOKED_texOff(0);
    vec3 scale = vec3(RedScale, GreenScale, BlueScale);
    vec3 bias = vec3(RedBias, GreenBias, BlueBias) / 255.0;
    vec3 gamma = vec3(RedGamma, GreenGamma, BlueGamma);

    vec3 c = clamp(color.rgb * scale + bias, 0.0, 1.0);
    color.rgb = clamp(pow(c, 1.0 / gamma), 0.0, 1.0);
    return color;
}
