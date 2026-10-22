    #pragma header

	uniform int mode;

	uniform sampler2D titulo;
	uniform float tituloX;
	vec4 invertTitle(vec4 color) {
		vec2 pos = openfl_TextureCoordv;
		pos.x -= tituloX;pos.y -= 0.5;pos.y *= 4.0;pos.y += 0.5+sin(openfl_TextureCoordv.x*20.0)*0.1;
		return vec4(abs(texture(titulo,pos).r-color.rgb),1.0);
	}

    void main()
    {
		vec2 pos = openfl_TextureCoordv;
		pos -= 0.5;
		float xx = abs(cos(pos.x));
		float yy = abs(cos(pos.y*0.5625));
		pos *= xx*yy;
		pos += 0.5;
		if(mode == 1) {
			pos -= 0.5;
			pos *= 0.8;
			pos += 0.5;
			gl_FragColor = vec4(flixel_texture2D(bitmap, pos).xyz-0.3,1.0);
		}
		else {
			gl_FragColor = invertTitle(flixel_texture2D(bitmap, pos));
		}
    }