enum ApiReferenceEnum {
  code('code'),
  data('data'),
  message('message'),
  content('content'),
  type('type');

  const ApiReferenceEnum(this.reference);
  final String reference;
}
