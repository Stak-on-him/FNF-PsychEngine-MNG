    #pragma header

	uniform float scroll;

	void main()
    {
		vec2 pos = openfl_TextureCoordv;pos.x += scroll-0.21302918207973695026715988491574;
		if(pos.x >= 0.0 && pos.x <= 3.0) {
			vec4 color = flixel_texture2D(bitmap, vec2(mod(pos.x,1.0),pos.y));
			if(floor(pos.x) == 0.0) {
				gl_FragColor = vec4(vec3(color.r),1.0);
			}
			else if(floor(pos.x) == 1.0) {
				gl_FragColor = vec4(vec3(color.g),1.0);
			}
			else {
				gl_FragColor = vec4(vec3(color.b),1.0);
			}
		}
		else {
			gl_FragColor = vec4(0.0);
		}
    }