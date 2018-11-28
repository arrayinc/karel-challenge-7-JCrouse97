/* File: Challenge-7.k
 ---------------------------
Now that Karel has mastered Halloween, it’s time to celebrate a
different holiday. Karel has decided to deliver beeper valentines
to every student in an elementary school class that is using Karel
to learn about programming. Karel does not remember exactly how
many desks are in each horizontal row but does remember that there
are precisely three rows of desks and the classroom.

Karel can count on the following facts:

• Karel starts at 1st Avenue and 1st Street, facing east, with an
infinite number of beepers in its bag.

• There are exactly three rows of student desks just to the south
of 3rd, 5th, and 7th Streets.

• Karel does not know how many desks are in each row (which may differ),
how many blank spaces there are between the desks, or how many spaces exist
between the desks at the ends of each row and the walls of the classroom.
What Karel does know is that each of the desks is exactly one unit wide
and that there are no desks right up against the wall.

When Karel is finished, all the desks in the room should have a valentine!
*/

//-------------------LOCAL LIBRARY---------------------

//***KAREL MUST START FACING RIGHT***

import "turns";

function toWall(){
	while(frontIsClear()){
		move();
	}
}

function up() {
	turnLeft();
	move();
	turnRight();
}

function right() {
	move();
}

function left() {
	turnAround();
	move();
	turnAround();
}

function down() {
	turnRight();
	move();
	turnLeft();
}

//-----------------------Actual Program-----------------------------

function SpreadLove(){
	turnLeft();
	move();
	turnRight();
	check();
}

function check(){
	while(frontIsClear()){
		move();
		findDeskLeft();
		findDeskRight();
		if(frontIsBlocked()){
			turnAround();
			move();
			move();
			if(noBeepersPresent()){
				turnAround();
				move();
				move();
				turn1();
			} else {
				turnAround();
				move();
				move();
				turn2();
				}
		}
	}
}

function findDeskLeft(){
		if(leftIsBlocked()){
			move();
			if(leftIsClear()){
				backup();
				putBeeper();
			} 
		}
}

function findDeskRight(){
		if(rightIsBlocked()){
			move();
			if(rightIsClear()){
				backup();
				putBeeper();
				move();
			}
		}
}

function turn1(){
	if(frontIsBlocked()){
		turnLeft();
		move();
		move();
		turnLeft();
	}
}

function turn2(){
	if(frontIsBlocked()){
		turnRight();
		move();
		move();
		turnRight();
	}
}
