function sortCompanies(a, b) {
  if (a.discount < b.discount) {
    return 1;
  }
  if (a.discount > b.discount) {
    return -1;
  }
  // a deve ser igual a b
  return 0;
}

export default sortCompanies;
