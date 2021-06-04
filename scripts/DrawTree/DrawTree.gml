function DrawTree(x, y, state, alpha){

	if (state == pointer_null)
	{
		return;	
	}

	var subImg = 0;

	if (state == Resource_Taken)
	{
		subImg = 1;
	}
	
	draw_sprite_ext(spr_Tree_Tall, subImg, x, y, 1, 1, 0, c_white, alpha);	

}