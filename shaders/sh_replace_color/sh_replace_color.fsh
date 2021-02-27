//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float range;
uniform vec4 colorMatch0;
uniform vec4 colorReplace0;
uniform vec4 colorMatch1;
uniform vec4 colorReplace1;
uniform vec4 colorMatch2;
uniform vec4 colorReplace2;
uniform vec4 colorMatch3;
uniform vec4 colorReplace3;
uniform vec4 colorMatch4;
uniform vec4 colorReplace4;
uniform vec4 colorMatch5;
uniform vec4 colorReplace5;
uniform vec4 colorMatch6;
uniform vec4 colorReplace6;
uniform vec4 colorMatch7;
uniform vec4 colorReplace7;
uniform vec4 colorMatch8;
uniform vec4 colorReplace8;
uniform vec4 colorMatch9;
uniform vec4 colorReplace9;

void main()
{
	vec4 pixelColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float newRange = range/255.0;
	
	if(abs(pixelColor.r - colorMatch0.r) <= newRange){
		if(abs(pixelColor.g - colorMatch0.g) <= newRange){
			if(abs(pixelColor.b - colorMatch0.b) <= newRange){
				pixelColor.rgb = colorReplace0.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch1.r) <= newRange){
		if(abs(pixelColor.g - colorMatch1.g) <= newRange){
			if(abs(pixelColor.b - colorMatch1.b) <= newRange){
				pixelColor.rgb = colorReplace1.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch2.r) <= newRange){
		if(abs(pixelColor.g - colorMatch2.g) <= newRange){
			if(abs(pixelColor.b - colorMatch2.b) <= newRange){
				pixelColor.rgb = colorReplace2.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch3.r) <= newRange){
		if(abs(pixelColor.g - colorMatch3.g) <= newRange){
			if(abs(pixelColor.b - colorMatch3.b) <= newRange){
				pixelColor.rgb = colorReplace3.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch4.r) <= newRange){
		if(abs(pixelColor.g - colorMatch4.g) <= newRange){
			if(abs(pixelColor.b - colorMatch4.b) <= newRange){
				pixelColor.rgb = colorReplace4.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch5.r) <= newRange){
		if(abs(pixelColor.g - colorMatch5.g) <= newRange){
			if(abs(pixelColor.b - colorMatch5.b) <= newRange){
				pixelColor.rgb = colorReplace5.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch6.r) <= newRange){
		if(abs(pixelColor.g - colorMatch6.g) <= newRange){
			if(abs(pixelColor.b - colorMatch6.b) <= newRange){
				pixelColor.rgb = colorReplace6.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch7.r) <= newRange){
		if(abs(pixelColor.g - colorMatch7.g) <= newRange){
			if(abs(pixelColor.b - colorMatch7.b) <= newRange){
				pixelColor.rgb = colorReplace7.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch8.r) <= newRange){
		if(abs(pixelColor.g - colorMatch8.g) <= newRange){
			if(abs(pixelColor.b - colorMatch8.b) <= newRange){
				pixelColor.rgb = colorReplace8.rgb;
			}	
		}		
	}
	
	if(abs(pixelColor.r - colorMatch9.r) <= newRange){
		if(abs(pixelColor.g - colorMatch9.g) <= newRange){
			if(abs(pixelColor.b - colorMatch9.b) <= newRange){
				pixelColor.rgb = colorReplace9.rgb;
			}	
		}		
	}
		
    gl_FragColor = pixelColor;
}
