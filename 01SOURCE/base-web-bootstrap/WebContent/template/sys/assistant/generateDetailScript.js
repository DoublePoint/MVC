function init(response) {
	var map=response.get("map");
	var entityString=map.entity;
	var repositoryString=map.repository;
	tabEntity.appendCode(entityString);
	tabRepository.appendCode(repositoryString);
}