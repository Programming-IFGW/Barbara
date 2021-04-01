 PROGRAM ANGRY_BIRDS
         IMPLICIT NONE
         REAL :: x=0.0, y=0.0, v=0.0, angle=0.0, t=0.0, hmax=0.0
         REAL, PARAMETER :: h0=1, d=100, g=9.8, dt=0.1, siz=0.5
         INTEGER, PARAMETER :: num_pig=2 
         INTEGER :: pig_in=1
         REAL, DIMENSION(2) :: bird=(/0.0,0.0/)
         REAL, PARAMETER, DIMENSION(2,2) :: pig=RESHAPE((/95,5,98,90/), SHAPE(pig))

1       PRINT*, "QUAL O ANGULO?"
        READ*, angle
        IF (angle > 180) THEN
                PRINT*, "ANGULO ERRADO!!!"
                GOTO 1
        END IF
       
        PRINT*, "QUAL O VALOR DA VELOCIDADE INICIAL?"
        READ*, v

        hmax=h0+((v*COSD(angle))**2)/(2*g)
      !  v0y=v*COSD(angle)
      !  vx=v*SIND(angle)

        DO WHILE (x < d) 
                DO pig_in=1, num_pig
                        PRINT*, SQRT(DOT_PRODUCT(bird-pig(:,pig_in),bird-pig(:,pig_in)))
                        PRINT*, bird
                        IF (SQRT(DOT_PRODUCT(bird-pig(:,pig_in),bird-pig(:,pig_in))) <= siz) THEN
                        PRINT*, "GANHOU :)"
                        EXIT       
                        END IF
                END DO
        t=t+dt
        x=(v**2*t*SIND(2*angle))/g
        y=h0+v*t*COSD(angle)-(g*t**2)/2
        bird=(/x,y/)
        END DO
        PRINT*, "PERDEU :("


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        CONTAINS
        
        FUNCTION dist(r1,r2)
               REAL :: dist
               REAL, DIMENSION(2) :: r1, r2
               
               dist=SQRT(DOT_PRODUCT(r1,r2))

        END FUNCTION

        END PROGRAM ANGRY_BIRDS
