void help();

void goto_print(char c, int x, int y);
void start()
{

//esi, ebp, esp, 
char buf []   = "yumus tosbagam benim------"  ;
char data [] = "Nisa";
char * adres = ( char * ) 0xb8000 ;
adres[0] = 'S';
adres[1] = 0xf;
adres[2] = 'a';
adres[3] = 0xf;
adres[4] = 'i';
adres[5] = 0xa;
int k ;
for ( k = 0 ; k < 20 ;k++ )
{
	adres[2*k] = buf[k];
	adres[2*k +1] = 0xa;

}

adres[100] = 'N';
adres[101] = 0xa;

adres[102] = data[0];
adres[103] = 0xa;

adres[104] = data[1];
adres[105] = 0xa;

adres[106] = data[2];
adres[107] = 0xa;

adres[108] = data[3];
adres[109] = 0xa;

adres[112] = buf[0];
adres[113] = 0xa;
/*
help();
*/
goto_print('S', 18, 18);
goto_print('a', 19, 18);
goto_print('i', 20, 18);
goto_print('m', 21, 18);


devam:
goto  devam;

}

void help()
{
char info [] = "This is an experimental kernel!\0";
char *p = info;
int k=0;
while(*p != '\0')
{
	goto_print(*p, k, 10);
	k ++;
	p++;
}

goto_print('N', 20, 15);
goto_print('i', 21, 15);
goto_print('s', 22, 15);
goto_print('a', 23, 15);
}

void goto_print(char c, int x, int y)
{
	char * adres = ( char * ) 0xb8000 ;

	adres[x+y*80] = c;
	adres[x+y*80+1] = 0xa;

	
}
