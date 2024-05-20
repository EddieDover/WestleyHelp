#ifndef Spell.h
#define Spell.h

#include <iostream>
#include <string>

class Spell {
public:
    std::string name;
    int baseDamage;
    double scalingFactor;

    Spell(std::string spellName, int base, double scaling) 
        : name(spellName), baseDamage(base), scalingFactor(scaling) {}
};

#endif // Spell.h