#include <stdio.h>

struct mystruct
{
  int i;
  char ch;
};

int main(void)
{
   FILE *stream;
   struct mystruct s;

   if ((stream = fopen("TEST.bin", "wb")) == NULL) 
   {
	  fprintf(stderr, "Cannot open output file.\n");
	  return 1;
   }
   s.i = 10;
   s.ch = 'A';
   fwrite(&s, sizeof(s), 1, stream); /* write struct s to file */
   fclose(stream); /* close file */
   if ((stream = fopen("TEST.txt", "wt")) == NULL)
   {
	  fprintf(stderr, "Cannot open output file.\n");
	  return 1;
   }
   fprintf(stream,"%d%c",s.i,s.ch); /* write struct s to file */
   fclose(stream); /* close file */
   return 0;
}

