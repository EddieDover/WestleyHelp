#ifndef Weapon.h
#define Weapon.h

#include <string>

class Weapon {
public:
    int weaponBase;
    double primaryScaling;
    double secondaryScaling;

    Weapon(int base, double primary, double secondary) : weaponBase(base), primaryScaling(primary), secondaryScaling(secondary) {}
};

class Scepter : public Weapon {
public:
    Scepter(std::string weaponName, int base, double primary, double secondary)
        : Weapon(base, primary, secondary) {}
    // Add specific methods for scepters here
};

#endif // Weapon.h