class Group {
  late String groupName;
  late String groupId;
  late String extension;
  late String description;
  late String groupRef;

  Group(
    this.groupName,
    this.groupId,
    this.extension,
    this.description,
  ) {
    groupRef = groupId + '###' + extension;
  }
}
