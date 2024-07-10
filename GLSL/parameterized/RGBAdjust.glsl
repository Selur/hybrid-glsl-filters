//!HOOK MAIN
//!BIND HOOKED
//!DESC RGBAdjust

// Scaling factors for each color channel
#define RedScale 1.0
#define GreenScale 1.0
#define BlueScale 1.0

// Bias adjustments for each color channel
#define RedBias 0.0
#define GreenBias 0.0
#define BlueBias 0.0

// Gamma adjustments for each color channel
#define RedGamma 1.0
#define GreenGamma 1.0
#define BlueGamma 1.0

/* A comprehensive RGB adjustment shader for mpv
   Similar to AviSynth RGBAdjust filter
   v0.1
*/

vec4 hook(){ 
    vec4 color = HOOKED_texOff(0);

    // Apply bias adjustments
    color.r += RedBias / 255.0;
    color.g += GreenBias / 255.0;
    color.b += BlueBias / 255.0;

    // Apply scaling adjustments
    color.r *= RedScale;
    color.g *= GreenScale;
    color.b *= BlueScale;

    // Apply gamma adjustments
    color.r = pow(color.r, RedGamma);
    color.g = pow(color.g, GreenGamma);
    color.b = pow(color.b, BlueGamma);

    return color;
}
