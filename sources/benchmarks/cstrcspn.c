int (cstrcspn)(const char *s1, const char *s2){
  const char *sc1;
  const char *s;
  int c;
  for (sc1 = s1; *sc1 != '\0'; sc1++) {
    s = s2;
    c = *sc1;
    while (*s != '\0' && *s != (char)c)
      s++;
    if (*s == c)
      return (sc1 - s1);
  }
  return sc1 - s1;            /* terminating nulls match */
}
