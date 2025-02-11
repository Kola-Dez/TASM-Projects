#include <stdio.h>

long filesize(FILE *stream);

int main(void)
{
   FILE *stream;
   char str[10];
   stream = fopen("MYFILE.TXT", "w+");
   fprintf(stream, "123456789");
   printf("Filesize of MYFILE.TXT is %ld bytes\n", filesize(stream));
   fseek(stream, 5L, SEEK_SET);
   fscanf(stream,"%s",str);
   printf("%s\n",str);
   fclose(stream);

   return 0;
}

long filesize(FILE *stream)
{
   long curpos, length;

   curpos = ftell(stream);
   fseek(stream, 0L, SEEK_END);
   length = ftell(stream);
   fseek(stream, curpos, SEEK_SET);
   return length;
}
