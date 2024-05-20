#ifndef Character.h
#define Character.h

#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Weapon
{
public:
    int weaponBase;
    double primaryScaling;
    double secondaryScaling;

    Weapon(int base, double primary, double secondary) : weaponBase(base), primaryScaling(primary), secondaryScaling(secondary) {}
};

class Spell
{
public:
    string name;
    int baseDamage;
    double scalingFactor;

    Spell(string spellName, int base, double scaling) : name(spellName), baseDamage(base), scalingFactor(scaling) {}
};

class Character
{
private:
    // Private member variables and methods

public:
    string name;
    string race;
    int level;
    int experience;
    int maxHealth;
    int health;
    int stamina;
    int might;
    int agility;
    int wisdom;
    int fortune;
    int mana;
    int attributePoints;
    vector<Weapon> weapons;
    vector<Spell> spells;

    // Constructor and public member functions
    Character(const string &n, const string &r, int lvl, int exp, int maxHP, int hp,
              int st, int mi, int ni, int wi, int fo, int ma);

    void displayStats() const;

    void addWeapon(const Weapon &weapon);

    void equipWeapon(int weaponIndex);

    void addSpell(const Spell &spell);

    void castSpell(int spellIndex);

    int attack() const;

    void levelUp();

    static string selectRace();

    static Character createCharacter();
};

#endif // Charcter.h