    #pragma header

	uniform float pos;

	float adapt(float a) {
		if(a > 1.0) {return 1.0;}
		if(a < 0.0) {return 0.0;}
		return a;
	}

	void main()
    {
		vec3 col = flixel_texture2D(bitmap, openfl_TextureCoordv).rgb;
		gl_FragColor = vec4(vec3(col.r),1.0)*col.b*adapt(col.g+pos);
    }