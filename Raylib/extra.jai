sign :: (x : $T) -> int {
	return ifx x < 0 then -1 else ifx x > 0 then 1 else 0;
}

GetRayCollisionCylinder :: (ray : Ray, a : Vector3, b : Vector3, ra : float) -> RayCollision {
	ro, rd := ray.position, ray.direction;
	ba := b  - a;
	oc := ro - a;
	baba := dot(ba, ba);
	bard := dot(ba, rd);
	baoc := dot(ba, oc);
	k2 := baba - bard * bard;
	k1 := baba * dot(oc, rd) - baoc * bard;
	k0 := baba * dot(oc, oc) - baoc * baoc - ra * ra * baba;
	h := k1 * k1 - k2 * k0;
	if h < 0 return .{hit = false};//no intersection
	h = sqrt(h);
	t := (-k1 - h) / k2;
	// body
	y := baoc + t * bard;
	if y > 0 && y < baba {
		return .{ 
			true,
			t,
			ro + t * rd,
			normalize((oc + t * rd - ba * y / baba) / ra)
		};
	}
	// caps
	t = ((ifx y < 0 then 0 else baba) - baoc) / bard;
	if abs(k1 + k2 * t) < h {
		return .{
			true,
			t,
			ro + t * rd,
			normalize(ba * cast(float)sign(y) / sqrt(baba)),
		};
	}
	return .{hit = false};
}