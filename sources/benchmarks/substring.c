int (substring)(char *s, char *t){
     char *ps = s;
     while (*ps != '\0') {
       char *ps2 = ps;
       char *pt = t;
       while (*pt != '\0' && *pt == *ps2) {
         pt++;
         ps2++;
       }
       if (*pt == '\0') return 1;
       ps++;
     }
     return 0;
}
