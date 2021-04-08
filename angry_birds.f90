 PROGRAM ANGRY_BIRDS
         IMPLICIT NONE
         REAL(8) :: x=0.0, y=0.0, angle=0.0, t=0.0, h_max=0.0, d=0.0, d_max=0.0
         REAL, PARAMETER :: h0=1, g=9.8, dt=1E-3, siz=0.5, v=100
         INTEGER :: pig_in=1, num_pig=0
         REAL, DIMENSION(2) :: bird=(/0.0,0.0/), pig=(/0.0,0.0/)
        REAL, DIMENSION(:), ALLOCATABLE :: pig_x, pig_y



        !!!!!!!!!! DISTANCIA MAXIMA DE ALCANCE !!!!!!!!!!!!

        d_max=(2*v**3*SIND(90.0)*COSD(45.0))/(g**2)
        h_max=h0+((v*COSD(45.0))**2)/(2*g)

       ! PRINT*, d_max
       ! PRINT*, h_max
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SORTEANDO OS PORQUINHOS !!!!!!!!!!!!
        
        OPEN(UNIT=15,FILE="pigs.dat",STATUS='REPLACE')
        PRINT*, "QUANTOS PORQUINHOS?"
        READ*, num_pig
        ALLOCATE(pig_x(num_pig))
        ALLOCATE(pig_y(num_pig))

        DO pig_in=1, num_pig
                pig_x(pig_in)=d_max*(0.1*RAND()+0.9)
                pig_y(pig_in)=0.1*h_max*RAND()
                pig=(/pig_x(pig_in),pig_y(pig_in)/)
                WRITE(15,*) pig
        END DO

        !!!!!!!!!!!!!!!!!!!!!!! COMEÇA O JOGO !!!!!!!!!!!!!!!!!!!

1       PRINT*, "QUAL O ANGULO?"
        READ*, angle
        IF (angle > 180) THEN
                PRINT*, "ANGULO ERRADO!!!"
                GOTO 1
        END IF
        
        OPEN(UNIT=16,FILE="birds.dat",STATUS='REPLACE')
       
      !  hmax=h0+((v*COSD(angle))**2)/(2*g)
      !  v0y=v*COSD(angle)
      !  vx=v*SIND(angle)
        d=(2*v**3*SIND(2*angle)*COSD(angle))/(g**2)
        DO WHILE (x .LE. d) 
                DO pig_in=1, num_pig
                      !  PRINT*, SQRT(DOT_PRODUCT(bird-pig(:,pig_in),bird-pig(:,pig_in)))
                        WRITE(16,*) bird
                        pig=(/pig_x(pig_in),pig_y(pig_in)/)
                        IF (SQRT(DOT_PRODUCT(bird-pig,bird-pig)) <= siz) THEN
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

        CLOSE(UNIT=15)
        CLOSE(UNIT=16)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        CONTAINS
        
        FUNCTION dist(r1,r2)
               REAL :: dist
               REAL, DIMENSION(2) :: r1, r2
               
               dist=SQRT(DOT_PRODUCT(r1,r2))

        END FUNCTION

        END PROGRAM ANGRY_BIRDS
