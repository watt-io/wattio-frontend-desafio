enum AudienceType { pf, pj, both }

String getAudienceLabel(AudienceType type) {
  switch (type) {
    case AudienceType.pf:
      return 'sua casa';
    case AudienceType.pj:
      return 'sua empresa';
    case AudienceType.both:
      return 'Ambos';
  }
}

AudienceType parseAudienceType(String? value) {
  switch (value) {
    case 'individual':
      return AudienceType.pf;
    case 'business':
      return AudienceType.pj;
    case 'both':
      return AudienceType.both;
    default:
      return AudienceType.pf; // ou lance erro, dependendo da lógica
  }
}
