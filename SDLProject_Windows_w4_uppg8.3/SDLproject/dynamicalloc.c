#include "dynamicalloc.h"

#define FREE 0  // The definitions are only visible in this .c-file
#define BUSY 1

typedef struct {
   GameObject* pObjects; // pekare till en stor statisk array
   bool* pSlots;         // pekare till en array med en bool per element
   int nElements;        // Antal element i arrayen
   int currentElement;   // senaste lediga plats + 1 (för att snabba
                         // upp sökning efter ny ledig plats
} AllocData;

#define SIZE 1000   // Max antal samtidigt existerande instanser
static GameObject   objects[SIZE]; 
static bool         slots[SIZE];
static AllocData    allocData = {objects, slots, SIZE, 0};

// Allokerar dynamiskt minnesutrymme för en instans
GameObject* allocElement()
{
	// Vi vill att alla slots skall vara initierade till FREE vid uppstart.
	static bool bFirstTime = true;
	if(bFirstTime) {
		bFirstTime = false;
		for (int i=0; i < SIZE; i++)
			allocData.pSlots[i] = FREE;
	}
	
    // Sök efter första lediga plats, men max nElements försök
    for(int i=0; i < allocData.nElements; i++) {
        int index = allocData.currentElement;
        allocData.currentElement = (allocData.currentElement + 1) % 
                                    allocData.nElements; 
        if(allocData.pSlots[index] == FREE) {
            allocData.pSlots[index] = BUSY;
            return &allocData.pObjects[index]; // returnera den lediga platsen
        }
    }
    // Ingen ledig plats hittades
    return 0;
}

// Sätter ett index till ledigt
void freeElement(GameObject* pObj)
{
    int index = pObj - &(allocData.pObjects[0]); 
    if (index >= 0 && index < allocData.nElements) {
        if(allocData.pSlots[index] == BUSY) {
            allocData.pSlots[index] = FREE;
            return;
        }
    }
    // Hamnar vi här har något gått fel
}
