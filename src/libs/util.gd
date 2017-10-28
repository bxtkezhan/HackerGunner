extends Node

func calcAngle(translation_src, translation_dst):
	var vect_src = Vector3(0, 0, 1)
	var vect_dst = translation_dst - translation_src
	var x = vect_dst.x
	var angle = vect_src.angle_to(vect_dst)
	return (2 * (x > 0) - 1) * angle