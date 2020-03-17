extern portu_oku(int port);
struct Point
{
int x, y;
};
//mathematical power operation...
long power ( int first , int us )
{
long j = first ;
if ( us == 0 ) return 1 ;
while ( --us  != 0 )
{
 j *= first ;
}
return j;
}
// Prints a character on the given coordinates with given background-front color
void goto_print(char c, int x, int y, char background)
{
	char * adres = ( char * ) 0xb8000 ;
	adres[2*(x+y*80)] = c;
	adres[2*(x+y*80)+1] = background;
	
}

//Clears rectangular area on screen...
void clear_rectangle(int start_x, int start_y, int end_x, int end_y)
{

	int x, y;
	for(y = start_y; y <= end_y ; y++)

	for(x = start_x; x <= end_x; x++)
	{
			goto_print(' ', x, y, 0x0);
	}
	
	}

//Returns the number of digits for the given integer...
int number_of_digits(int value)
{
	int digit_count=0;
	while( value / power(10, digit_count))
	{
			digit_count++;
	}
	return digit_count--;
}	

//Print a character on the given coordinates with given color information	
void print_xy ( char * data , int x , int y, char background )
{
char * mem = ( char * ) 0xb8000;

    while ( *(data) != '\0' )
  {
mem[  2*( x + 80* y ) ]  = *data ;
mem [ 2*(x + 80*y )+1 ] = background ;
data++ ;
x++ ;
if ( x == 80 ) {  x = 0 ; y++ ; }

  }

}

//prints number on given coordinates...
void print_number (  int rakam , int x  , int y )
{
    char buff [ 12]={0};
int k = rakam ;
char first_ = 0 ;
int l = 10 ;
char * p ;
int index = 0 ;
char fg [ 2 ] = { 0 } ;
while ( l >= 0  )
{

 buff [ index ] = k / power( 10 , l )+48 ;
 k = k %  power ( 10 , l ) ;
index ++ ;
l-- ;

}
int j =  0;
while ( buff [j ] == '0' ) j++ ;

if ( j == 11 ) {buff[ 0 ] = '0' ; buff[0] = '\0'; p = buff  ; }
else p = buff + j ;
//numbers are white color
print_xy ( p , x , y, 0xf  );



}




void help()
{
char info [] = "This is an experimental kernel!";
char *p = info;
int k=0;
while(*(p) != '\0')
{
	goto_print(*p, k, 10, 0xa);
	k ++;
	p++;
}
goto_print('N', 20, 15, 0xa);
goto_print('i', 21, 15, 0xa);
goto_print('s', 22, 15, 0xa);
goto_print('a', 23, 15, 0xa);
}



//Random number generator...
//https://code.woboq.org/userspace/glibc/stdlib/rand_r.c.html
int
rand (unsigned int *seed)
{
  unsigned int next = *seed;
  int result;

  next *= 1103515245;
  next += 12345;
  result = (unsigned int) (next / 65536) % 2048;

  next *= 1103515245;
  next += 12345;
  result <<= 10;
  result ^= (unsigned int) (next / 65536) % 1024;

  next *= 1103515245;
  next += 12345;
  result <<= 10;
  result ^= (unsigned int) (next / 65536) % 1024;

  *seed = next;

  return result;
}

//Read PS2 controller and return the key...
unsigned char getkey()
{
    unsigned char kbdus[128] =
{
    0,  27, '1', '2', '3', '4', '5', '6', '7', '8',	/* 9 */
  '9', '0', '-', '=', '\b',	/* Backspace */
  '\t',			/* Tab */
  'q', 'w', 'e', 'r',	/* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',	/* Enter key */
    0,			/* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',	/* 39 */
 '\'', '`',   0,		/* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',			/* 49 */
  'm', ',', '.', '/',   0,				/* Right shift */
  '*',
    0,	/* Alt */
  ' ',	/* Space bar */
    0,	/* Caps lock */
    0,	/* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,	/* < ... F10 */
    0,	/* 69 - Num lock*/
    0,	/* Scroll Lock */
    0,	/* Home key */
    0,	/* Up Arrow */
    0,	/* Page Up */
  '-',
    0,	/* Left Arrow */
    0,
    0,	/* Right Arrow */
  '+',
    0,	/* 79 - End key*/
    0,	/* Down Arrow */
    0,	/* Page Down */
    0,	/* Insert Key */
    0,	/* Delete Key */
    0,   0,   0,
    0,	/* F11 Key */
    0,	/* F12 Key */
    0,	/* All other keys are undefined */
};




int code;

/*
https://wiki.osdev.org/%228042%22_PS/2_Controller

The PS/2 Controller itself uses 2 IO ports (IO ports 0x60 and 0x64). 
Like many IO ports, reads and writes may access different internal registers.

To poll, wait until bit 0 of the Status Register becomes set, then read the received byte of data from IO Port 0x60.

There are 2 major problems with polling. The first problem is that (like all polling) 
it wastes a lot of CPU time for nothing. The second problem is that if the PS/2 controller supports two PS/2 devices, 
there's no way to reliably determine which device sent the byte you received, 
unless one of them is disabled and unable to send data.
*/

code = portu_oku ( 0x60 ) ;
//128 characters max ...
if ( code & 0x80 ) ;
else
{
	return kbdus[ code ] ;;
}

return 0;
}


//Not exact times, but useful, needs to be rectified...
void DelayUs(int us)
{
	int k = 0; 
	for(; k < 1000*us; k++);

}

void DelayMs(int ms)
{
	int k = 0;
	for(; k < ms; k++)
	DelayUs(1000);

}
typedef unsigned char byte;
typedef unsigned char bool;
#define FALSE 0
#define TRUE 1

void start()
{
clear_rectangle(0, 0, 80, 24); 

help();
const char  info []  = "An experimental Snake game designed as a simple Kernel...";
const char info2 [] = "Press a Key to start game...";
char tus = 0;
print_xy((char*)info, 0, 10, 0xc);
print_xy((char*)info2, 0, 15, 0xa);

while((tus=getkey()) == 0); 

clear_rectangle(0, 0, 80, 24);

long score = 0;





struct Point SnakePoints [100] = {0};
struct Point food, oldfood;
#define RIGHT 0
#define LEFT 1
#define UP 2
#define DOWN 3

int number = 101;

start_new_round:;
//Start length of snake...
int snake_length = 6;
char snake_direction = rand(&number) % 4;
SnakePoints[0].x = 20;
SnakePoints[0].y = 10;
int index = 0;
//All points are at the same location at the beginning...
for(index=1; index < snake_length; index++)
	SnakePoints[index] = SnakePoints[index-1];

bool conflict = FALSE, crash = FALSE;
int grow_delay = 0;
//Place food randomly, avoid placing onto snake...
do
{	
conflict = FALSE;
food.x = rand(&number) % 80;
food.y = rand(&number) %24;
for(index = 0; index < snake_length; index++)
	if((food.x == SnakePoints[index].x) && (food.y == SnakePoints[index].y)){conflict = TRUE; break;}
}
while( conflict == TRUE);
	
devam:
//get key from keyboard controller
tus = getkey();
//If a new key has been pressed...
if(tus != 0)
{
goto_print(tus, 0, 24, 0xc);
//Set direction of the snake...
if(tus == 'w') {if(snake_direction != DOWN) snake_direction = UP;}
else if(tus == 's')  {if(snake_direction != UP)snake_direction = DOWN;}
else if(tus == 'a')  {if(snake_direction != RIGHT)snake_direction = LEFT;}
else if(tus == 'd')  {if(snake_direction != LEFT)snake_direction = RIGHT;}
else if(tus == 'k') {}

}

//Erase tail of snake...
goto_print(' ', SnakePoints[snake_length-1].x, SnakePoints[snake_length-1].y, 0xa);
//Shift snake forward...
for(index=snake_length-1; index >= 1; index--)
	SnakePoints[index] = SnakePoints[index-1];

//Shift head forward....
//If snake exceeds the screen limits, snake will continue as if top and right sides are wrapped with botton and left sides respectively...	
switch(snake_direction)
{
	case UP:
		SnakePoints[0].y--;
		if(SnakePoints[0].y == -1) SnakePoints[0].y = 24;
		break;
	case DOWN:
		SnakePoints[0].y++;
		if(SnakePoints[0].y == 25) SnakePoints[0].y = 0;
		break;
	case RIGHT:
		SnakePoints[0].x++;
		if(SnakePoints[0].x == 81) SnakePoints[0].x = 0;
		break;
	case LEFT:
		SnakePoints[0].x--;
		if(SnakePoints[0].x == -1) SnakePoints[0].x = 80;
		break;
}


//Display food on screen...
goto_print('+', food.x, food.y, 0xc);
//Display only the head location, tail will gradually erase intermediate points....
goto_print('*', SnakePoints[0].x, SnakePoints[0].y, 0xa);

//If snake tail reaches the food, grow snake in length...
if (oldfood.x == SnakePoints[snake_length-1].x && oldfood.y == SnakePoints[snake_length-1].y)
{
	snake_length++;
	oldfood = food;
}

		
goto_print('+', oldfood.x, oldfood.y, 0x4);


//Check whether snake head is on snake itself...
for(index = 3 ; index < snake_length; index++)
{
//If snake head runs into snake itself
	if((SnakePoints[0].x == SnakePoints[index].x) && (SnakePoints[0].y == SnakePoints[index].y))
	{
		int t;

		//Three times create a blink effect on screen....
		for(t= 0; t < 3; t++)
{	for(index = 0; index < snake_length; index++)
	goto_print(' ', SnakePoints[index].x, SnakePoints[index].y, 0xa);
	DelayMs(250);
	for(index = 0; index < snake_length; index++)
	goto_print('*', SnakePoints[index].x, SnakePoints[index].y, 0xa);
	DelayMs(250);
	}
//clear the snake from screeen...
	for(index = 0; index < snake_length; index++)
	goto_print(' ', SnakePoints[index].x, SnakePoints[index].y, 0xa);

	
crash = FALSE;
//Start new round by starting from stratch....
//Clear screen, reset score
clear_rectangle(0, 0, 80, 24);
score = 0;

goto start_new_round;
		break;
	}
}




//if snake head arrives food, 

if((SnakePoints[0].x == food.x) && (SnakePoints[0].y == food.y))
{
oldfood = food;
//Find a new location for new food...
score += 10;
do
{	
conflict = FALSE;
food.x = rand(&number) % 80;
food.y = rand(&number) %24;
for(index = 0; index < snake_length; index++)
	if((food.x == SnakePoints[index].x) && (food.y == SnakePoints[index].y)){conflict = TRUE; break;}
}
while( conflict == TRUE);
}

char scor [] = "Score : 0";
print_xy(scor, 0, 0, 0xf);
print_number(score, 8,0);
print_number(snake_length, 80-number_of_digits(snake_length), 0);
DelayMs(60);
goto  devam;

}

