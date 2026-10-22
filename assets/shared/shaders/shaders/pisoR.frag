    #pragma header

	uniform float posx;
	uniform float intro;

	float mini(float a,float b) {
		if(a < b) {return a;}
		return b;
	}

    void main()
    {
		vec2 pos = vec2(openfl_TextureCoordv.x*1280.0,(0.15+openfl_TextureCoordv.y*0.85)*720.0);
		float x = 640.0 - pos.x;
		float y = pos.y + 512.0;
		float z = pos.y + 0.01;
		float px = (x / z) * 48.0;
		float py = (y / z) * 48.0;
		float mx = px/128.0;
		float my = py/128.0;
		vec4 color = flixel_texture2D(bitmap, 1.0-vec2(mod(mx+posx,1.0),mod(my+posx,1.0)));

		float val = 1.0-openfl_TextureCoordv.x+intro+color.y;
		if(val > 1.0) {val = 1.0;}if(val < 0.0) {val = 0.0;}

		float dis = mini(openfl_TextureCoordv.y*5.0,1.0)*val;
		gl_FragColor = vec4(vec3(color.x),1.0)*dis;
    }