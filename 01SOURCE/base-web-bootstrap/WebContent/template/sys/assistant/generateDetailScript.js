function init(response) {
	var map=response.get("map");
	var entityString=map.entity;
	tabEntity.appendCode(entityString);
}