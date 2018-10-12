/************************************
*                                   *
*  Shark Creator, by Léo Abiguime   *
*  version 1.0                      *
*                                   *
*  This computer program allows you *
*  to generate sharks by using      *
*  the function createShark(...)    *
*                                   *
*                                   *
*  "But as they say about sharks,   *
*   it's not the ones you see that  *
*   you have to worry about, it's   *
*   the ones you don't see.         *
*          - David Blaine           *
*************************************/


void setup() 
{
  size( 500 , 500 ) ;
}

void draw()
{
  // This is an example of how to use that function.
  // You can generate more sharks by calling that function several times
  // It would be useful to create a function deleteShark( int sharkID )
  // Then we could make our sharks move and create a virtual
  // fishtank...
  background( 50 ) ; // Our shark is in deep water 8-)
  createShark( 250 ,  250 , 75 , 30 , 79 , 158 ) ; 
  
}

void createShark( int sCenterX , int sCenterY , int sSize , int sColorR , int sColorG , int sColorB )
{

////////////////////////////////////////////////////////////////////////////////

  fill( sColorR , sColorG , sColorB ) ;
  
/************************************** 
* First of all, let's create the body *
* It's not a regular shape, so we     *
* create our own shape.               *
***************************************/
  
  beginShape() ;
  
  vertex( sCenterX - sSize , sCenterY-( round( sSize*0.75 ) ) ) ;
  vertex( sCenterX + sSize + round( sSize/2 ) , sCenterY-( round( sSize*0.75 ) ) ) ;
  vertex( sCenterX + sSize , sCenterY+( round( sSize*0.75 ) ) ) ;
  vertex( sCenterX - sSize , sCenterY+( round( sSize*0.75 ) ) ) ;
  vertex( sCenterX - sSize - round( sSize/2 ) , sCenterY ) ;
  
  endShape( CLOSE ) ;

/***************************************
* Our sharks have two fins. They are   *
* triangle shaped, so we use the       *
* in-built function.                   *
****************************************/

  fill( sColorR-40 , sColorG-40 , sColorB-40 ) ; // The fins always are slightly darker
  
  triangle( sCenterX-(round(sSize/3)), sCenterY-(round(sSize*0.75))-round(sSize/2),  
            sCenterX-(round(sSize/3)), sCenterY-(round(sSize*0.75)), 
            sCenterX+(round(sSize/3)), sCenterY-(round(sSize*0.75)) 
            ) ;
   
  triangle( sCenterX - sSize - round( sSize/2 ) , sCenterY , 
            sCenterX - sSize - round( sSize/3 ) - round( sSize/2 ) , sCenterY + ( round( sSize*0.75*0.75 ) ) , 
            sCenterX - sSize - round( sSize/3 ) - round( sSize/2 ) , sCenterY - ( round( sSize*0.75*0.75 ) )
            ) ;
  
////////////////////////////////////////////////////////////////////////////////

/***************************************
* We will now create what is on its    *
* body: eye, mouth, teeth and gills.   *
****************************************/

  
  // This is its eye
  
  fill( 0 ) ; // No matter what, its eye will always be black.
  
  ellipse( round( ( sCenterX + sSize + sCenterX + ( round( sSize/3 ) ) ) * 0.5 ) , sCenterY - round( sSize * 0.5 ) , round( sSize/5 ), round( sSize/5 ) ) ; 
  
  fill( sColorR , sColorG , sColorB ) ;
  
  // Now we create the mouth
  // We use Thales Theorem to find the position of the mouth on the edge of its head (a/b = c/d)
  line( sCenterX + ( round( sSize/3 ) ) , sCenterY + ( round( sSize*0.50 ) ) , 
        sCenterX + sSize + ( round( ( ( round( sSize/2 ) ) * ( ( round( sSize*0.20 ) ) ) ) / ( ( round( sSize*0.75 ) ) * 2 ) ) ) , sCenterY + ( round ( sSize*0.50 ) ) 
        ) ;
  line( sCenterX - ( round( sSize/3 ) ) - ( round( ( ( ( ( round( ( ( round( sSize/2 ) ) * ( ( round( sSize*0.20 ) ) ) ) / ( ( round( sSize*0.75 ) ) * 2 ) ) ) ) - 
        ( ( round( sSize / 3 ) ) ) ) / 2 ) ) ) + round( sSize * 0.25 ) , // It is long because of Thales Theorem
        sCenterY + ( round( sSize*0.35 ) ) , sCenterX + ( round( sSize/3 ) ) , sCenterY + ( round( sSize*0.50 ) ) ) ;
  
  
  // Now we create the teeth (they are gonna be triangles)
  
  fill( 255 ) ; // Its teeth will always be white
  
  int mouth_x1 = ( round( sSize/3 ) ) ;
  int mouth_x2 = ( round( ( ( round( sSize/2 ) ) * ( ( round( sSize*0.20 ) ) ) ) / ( ( round( sSize*0.75 ) ) * 2 ) ) ) ;
  
  triangle( sCenterX + ( round( sSize/3 ) ) + round( 0.3 * (mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.60 ) ) , sCenterX + ( round( sSize/3 ) ) + round( 0 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) , sCenterX + ( round( sSize/3 ) ) +round( 2 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) ) ;
  triangle( sCenterX + (round( sSize/3 ) ) + round( 2.3 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.60 ) ) , sCenterX + ( round( sSize/3 ) ) + round( 2 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) , sCenterX + ( round( sSize/3 ) ) +round( 4 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) ) ;
  triangle( sCenterX + (round( sSize/3 ) ) + round( 4.3 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.60 ) ) , sCenterX + ( round( sSize/3 ) ) + round( 4 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) , sCenterX + ( round( sSize/3 ) ) +round( 6 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) ) ;
  triangle( sCenterX + (round( sSize/3 ) ) + round( 6.3 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.60 ) ) , sCenterX + ( round( sSize/3 ) ) + round( 6 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + ( round( sSize*0.50 ) ) , sCenterX + ( round( sSize/3 ) ) +round( 7.6 * ( mouth_x1 + mouth_x2 ) / 4 ) , sCenterY + (round( sSize*0.50 ) ) ) ;
  
  
  noFill();
  // These are the gills
  arc( sCenterX + ( ( round( sSize/2 ) ) ) , sCenterY - round( sSize*0.5 ) , round( round( sSize/5 )*1.75 ) ,round( round( sSize/5 ) * 1.75 ) , radians( 145 ) , radians( 235 ) ) ;
  arc( sCenterX + ( ( round( sSize/3 ) ) ) , sCenterY - round( sSize*0.48 ) , round( round( sSize/5 )*1.75 ) ,round( round( sSize/5 ) * 1.75 ) , radians( 145 ) , radians( 235 ) ) ;
  arc( sCenterX + ( ( round( sSize/6 ) ) ) , sCenterY - round( sSize*0.46 ) , round( round( sSize/5 )*1.75 ) ,round( round( sSize/5 ) * 1.75 ) , radians( 145 ) , radians( 235 ) ) ;
  arc( sCenterX + ( ( round( sSize/2 ) ) ) + round( sSize*0.90 ) , sCenterY - round( sSize*0.46 ) , round( round( sSize/5 ) * 1 ) , round( round( sSize/5 )*2.75 ) , radians( 160 ) , radians( 200 ) ) ;

////////////////////////////////////////////////////////////////////////////////
}

/*                                                                                                  
                                                                               `-/                  
                                                                            .+ymm-                  
                                                                          /yhoyy`                   
                                                                        /hs++sy                     
                                                                      `yy++++m`                     
                                                                     `ds+++++d                      
                                               ./oshN:               ss++++++d`                     
     `o+/:`                                ./shys+od-                d+++++++s:                     
     s/+++so+-                          .+yyo+++++d-                 d+++++++s.                     
    :o-o+++++oso+-                    :syo+++++++ss                  y+++++++++++:`                 
    s/-o+++++++++syso:`             -ys++++++++++y/                  -o+++++++++++ss+-              
    h:-:s++++++++++++oyyso:.       os++++++++++++y:               .:/++++++++++++++++syssoooosymy   
    d:--/o+++++++++++ososssyyyso/-o++++++++++++++o+         `-/+oso+++++++++++++++++++++++++shs.    
    y+---+o++++++++++h` :mMNdhyssyyhhhhhhhyyyssssss:/++oossyso+++++++++++s/:+so++++++++osyys:       
    +y----+o+++++++++h .MMMMMMMMm-:os+++++ooosssssooo+++++++++++++++++++oy.   -/+oooooo+:`          
    `m-----/s++++++++y-.MMMMMMMMd `y+++++++++++++++++++++++++++++++++++oy:                          
     so-----:oo+++++++y::dMMMMMy./y+++++++++++++++++++++++++++++++++++++s+//::-                     
     .m-------/oo++++++os++ooo++so++++++++++++++++++++++++++++++++++++++++osyy/                     
      /h--------:+ooo+++++osssooooo+++++++++++++++++++++++++++++++++oy////:.                        
       yo-----------://///::----:--:/+o++++++++++++++++++++++++++++sh-                              
        h/--------------------+/o------/+++++++++++++++++++++++++oyy`                               
        `y/----------------/os-o+--------/++++++++++++++++++++oo+y+                                 
          s/-----------:ooy/`/.y----------o+++++++++++++oooo+/-sy.                                  
           /+-----:/oso:` / .oy-----------y+++++++++o-:::----+h:                                    
            `-./:::. /.--./.so------------y+++++++++s------+h/                                      
                .--  :.  .ss--------------oy+++++++oy----oy/                                        
                   --.//oo-----------------d+++++++oh-/ys-                                          
                     os+/:-----------------+h+++++++ms/`                                            
                      .` .://:--------------sh++++++d.                                              
                             .:/+++oooooossyosdo++++ys                                              
                                      -os++y- .yho+++m-                                             
                                        `/+oh:  .oyhssd-                                            
                                                   `:+sy.                                           
                                                                                     
*/
