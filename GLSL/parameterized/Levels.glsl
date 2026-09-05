//!HOOK MAIN
//!BIND HOOKED
//!DESC Levels

// Define levels adjustment parameters
#define input_low 16.0
#define input_high 235.0
#define gamma 1.0
#define output_low 0.0
#define output_high 255.0

vec4 hook() {
    vec4 color = HOOKED_texOff(0);

    // Normalize input and output parameters to [0, 1] range
    float input_low_norm = input_low / 255.0;
    float input_high_norm = input_high / 255.0;
    float output_low_norm = output_low / 255.0;
    float output_high_norm = output_high / 255.0;

    // Apply input low/high levels
    vec3 normalized = (color.rgb - input_low_norm) / (input_high_norm - input_low_norm);
    
    // Ensure values are within the [0, 1] range before gamma correction
    normalized = clamp(normalized, 0.0, 1.0);

    // Apply gamma correction using 1/gamma
    vec3 gamma_corrected = pow(normalized, vec3(1.0 / gamma));

    // Apply output low/high levels
    vec3 adjusted_output = gamma_corrected * (output_high_norm - output_low_norm) + output_low_norm;

    // Ensure values are within the [0, 1] range
    color.rgb = clamp(adjusted_output, 0.0, 1.0);

    return color;
}
