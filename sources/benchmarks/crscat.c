char *(cstrcat)(char *s1, const char *s2) {
  char *s = s1;
  /* Move s so that it points to the end of s1.  */
  while (*s != '\0')
    s++;
  /* Do the copying in a loop.  */
  while ((*s++ = *s2++) != '\0')
    ;               /* The body of this loop is left empty. */
  /* Return the destination string.  */
  return s1;
}
