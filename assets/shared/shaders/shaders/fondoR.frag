    #pragma header

	uniform float posx;
	uniform float intro;

	float maxi(float a,float b) {
		if(a > b) {return a;}
		return b;
	}
	float mini(float a,float b) {
		if(a < b) {return a;}
		return b;
	}

    void main()
    {
		vec2 pos = openfl_TextureCoordv;
		pos.y -= 0.5;
		float alp = sin(openfl_TextureCoordv.x*3.1415926535897932384626433832795);
		pos.y *= alp;
		pos.y += 0.5;
		vec3 colorA = flixel_texture2D(bitmap, vec2(mod(pos.x-posx,1.0),mod(pos.y-posx,1.0))).rgb;
		vec3 colorB = flixel_texture2D(bitmap, vec2(mod(pos.x+posx,1.0),mod(pos.y-posx-0.3,1.0))).rgb;
		float alpA = maxi(0.0,mini(1.0,1.0-openfl_TextureCoordv.x+intro+colorA.b));
		float alpB = maxi(0.0,mini(1.0,openfl_TextureCoordv.x+intro+colorB.b));
		gl_FragColor = vec4(vec3((colorA.r*colorA.r)+(colorB.r*colorB.r)),1.0)*maxi(alpA,alpB);
    }