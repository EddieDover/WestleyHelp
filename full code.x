#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
#include <vector>

using namespace std;
string selectRace();
const int softCap1 = 20;
const int softCap2 = 35;
const int hardCap = 50;

class Weapon
{
  public:
    int weaponBase;
    int weaponScaling;
    
    Weapon(int base, int scaling) : weaponBase(base), weaponScaling(scaling) {}
};

class spell
{
    public:
      int spellBase;
      int scepterScaling;
      
class Character
{
  private:
    double altBuff;
    double spellBuff;
    double abilityBuff;
    double defenseDebuff;
    double offenseDebuff;
    double healthDebuff;
    double staminaDebuff;

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
    
    //player stat display
    void displayStats() const
    {
        cout << "Name: " << name << endl;
        cout << "Race: " << race << endl;
        cout << "Level: " << level << endl;
        cout << "Experience: " << experience << endl;
        cout << "Health: " << health << "/" << maxHealth << endl;
        cout << "Stamina (Endurance): " << stamina << endl;
        cout << "Might (Strength): " << might << endl;
        cout << "agility (Agility): " << agility << endl;
        cout << "Wisdom (Intelligence): " << wisdom << endl;
        cout << "Fortune (Luck): " << fortune << endl;
        cout << "Mana: " << mana << endl;
    }

    //constructor
    Character(const string &n, const string &r, int lvl, int exp, int maxHP, int hp,
              int st, int mi, int ni, int wi, int fo, int ma)
        : name(n), race(r), level(lvl), experience(exp), maxHealth(maxHP), health(hp),
          stamina(st), might(mi), agility(ni), wisdom(wi), fortune(fo), mana(ma),
          altBuff(1.0), spellBuff(1.0), abilityBuff(1.0),
          defenseDebuff(1.0), offenseDebuff(1.0),
          healthDebuff(1.0), staminaDebuff(1.0),
          equippedWeaponIndex(-1) {}

    //weapon(s) select/inventory function
        void addWeapon(const Weapon &weapon) {
        weapons.push_back(weapon);
        if (equippedWeaponIndex == -1) {
            equippedWeaponIndex = 0;
        }
    }

    void equipWeapon(int weaponIndex) {
        if (weaponIndex >= 0 && weaponIndex < weapons.size()) {
            equippedWeaponIndex = weaponIndex;
        } else {
            cout << "Invalid weapon index!" << endl;
        }
    }

    void addSpell(const Spell &spell) {
        spells.push_back(spell);
    }

    void castSpell(int spellIndex) {
        if (spellIndex < 0 || spellIndex >= spells.size()) {
            cout << "Invalid spell index!" << endl;
            return;
        }

        Spell &spell = spells[spellIndex];
        double totalDamage = spell.baseDamage * spell.scalingFactor;

        // Apply weapon bonuses if equipped
        if (equippedWeaponIndex >= 0 && equippedWeaponIndex < weapons.size()) {
            Weapon &weapon = weapons[equippedWeaponIndex];
            totalDamage *= (1 + weapon.primaryScaling); // Adjust scaling as needed
        }

        cout << "Casting " << spell.name << " for " << totalDamage << " damage!" << endl;
    }
};
        
        class Spell {
public:
    string name;
    int baseDamage;
    double scalingFactor;

    Spell(string spellName, int base, double scaling) 
        : name(spellName), baseDamage(base), scalingFactor(scaling) {}
};

        class Weapon
    {
      public:
        int weaponBase;        
        double primaryScaling;  
        double secondaryScaling;

        Weapon(int base, double primary, double secondary) : weaponBase(base), primaryScaling(primary), secondaryScaling(secondary) {}
    };
    
    //Scepters for mages 
class Scepter : public Weapon {
public:
    Scepter(string weaponName, int base, double primary, double secondary)
        : Weapon(weaponName, base, primary, secondary) {}
  // Add specific methods for scepters here
};


    //below will be the attacking/deffense
    //critical hit function
    const double BASE_CRITICAL_CHANCE = 5.0;
    if (foPoints > 0)
    {
        if (fortune < hardCap)
        {
            if (fortune >= softCap2)
            {
                fortune += max(luPoints / 4, 1);
            }
            else if (fortune >= softCap1)
            {
                fortune += max(foPoints / 2, 1);
            }
            else
            {
                fortune += foPoints;
            }
            fortune = min(fortune, hardCap);
        }
    }
    double actualCriticalChance;
    if (fortune < softCap1)
    {
        actualCriticalChance = BASE_CRITICAL_CHANCE + fortune * 0.1;
    }
    else if (fortune < softCap2)
    {
        actualCriticalChance = BASE_CRITICAL_CHANCE + 2.0 + sqrt(fortune - softCap1);
    }
    else
    {
        actualCriticalChance = BASE_CRITICAL_CHANCE + 2.75 + sqrt(fortune - softCap2) / 2;
    }

    //soft1 soft2 and hard cap function for weapon scaling from attributes

    // Function to calculate scaling factor for the first stat
    double calculateFirstScalingFactor(int firstStat) const
    {
        double firstScaling;
        if (firstStat <= softCap1)
        {
            firstScaling = 1.4 * firstStat;
        }
        else if (firstStat <= softCap2)
        {
            firstScaling = 1.3 * firstStat;
        }
        else
        {
            firstScaling = firstStat + 1;
        }
        return firstScaling;
    }

    // Function to calculate scaling factor for the secondary stat

    double calculateSecondScalingFactor(int secondStat) const
    {
        double secondScaling;
        if (secondStat <= softCap1)
        {
            secondScaling = 0.6 * secondStat;
        }
        else if (secondStat <= softCap2)
        {
            secondScaling = 0.4 * secondStat;
        }
        else
        {
            secondScaling = 0.3 * secondStat;
        }
        return secondScaling;
    }

    // Function to calculate the total scaling factor for weapon damage

    double calculateTotalScalingFactor(int firstStat, int secondStat) const
    {
        double firstScaling = calculateFirstScalingFactor(firstStat);
        double secondScaling = calculateSecondScalingFactor(secondStat);
        return firstScaling + secondScaling;
    }
};

//attacking
int attack() const
{
    if (equippedWeaponIndex != -1)
    {
        const Weapon &equippedWeapon = weapons[equippedWeaponIndex];
     
           //attacking functions
        int attack() const
        {
            if (equippedWeaponIndex != -1)
            {
                const Weapon &equippedWeapon = weapons[equippedWeaponIndex];
                int totalDamage = (equippedWeapon.weaponBase + equippedWeapon.weaponScaling) * (altBuff + abilityBuff + spellBuff) * offenseDebuff;
                cout << name << " attacks for " << totalDamage << " damage!" << endl;
                return totalDamage;
            }
            else
            {
                int baseDamage = 10 + (might * 1.5);
                int totalDamage = baseDamage * (altBuff + spellBuff + abilityBuff) * offenseDebuff;
                cout << name << " attacks for " << totalDamage << " damage!" << endl;
                return totalDamage;
            }
        }

        //level up function
        void levelUp()
        {
            level++;
            health = maxHealth;
            if (level < 16)
            {
                maxHealth += 10;
                attributePoints += 3;
            }
            else if (level < 26)
            {
                attributePoints += 2;
            }
            else if (level < 30)
            {
                attributePoints++;
                maxHealth += 3;
            }
            else if (level >= 30)
            {
                if (level % 2 == 0)
                {
                    attributePoints++;
                    maxHealth += 2;
                }
            } // If level is even
        }

        void CharacterdisplayStats() const
        {
            cout << "Name: " << name << endl;
            cout << "Race: " << race << endl;
            cout << "Level: " << level << endl;
            cout << "Experience: " << experience << endl;
            cout << "Health: " << health << "/" << maxHealth << endl;
            cout << "Stamina (Endurance): " << stamina << endl;
            cout << "Might (Strength): " << might << endl;
            cout << "agility (Agility): " << agility << endl;
            cout << "Wisdom (Intelligence): " << wisdom << endl;
            cout << "Fortune (Luck): " << fortune << endl;
            cout << "Mana: " << mana << endl;
        }

        string selectRace()
        {
            cout << "Choose your race:" << endl;
            cout << "1. Olympian" << endl;
            cout << "2. Nymph" << endl;
            cout << "3. Satyr" << endl;
            cout << "4. Cyclops" << endl;
            cout << "5. Siren" << endl;
            cout << "6. Dryad" << endl;
            cout << "7. Empusae" << endl;
            int choice;
            cin >> choice;

            switch (choice)
            {
            case 1:
                return "Olympian";
            case 2:
                return "Nymph";
            case 3:
                return "Satyr";
            case 4:
                return "Cyclops";
            case 5:
                return "Siren";
            case 6:
                return "Dryad";
            case 7:
                return "Empusae";
            default:
                cout << "Invalid choice. Defaulting to Mere Mortal." << endl;
                return "Mere Mortal";
            }
        }

        Character createCharacter()
        {
            string name, race;
            int initialMana;
            cout << "Enter your character's name: ";
            cin >> name;

            race = selectRace();

            int stamina, might, agility, wisdom, fortune;

            if (race == "Olympian")
            {
                stamina = 11;
                might = 14;
                agility = 7;
                wisdom = 11;
                fortune = 8;
            }
            else if (race == "Nymph")
            {
                stamina = 7;
                might = 7;
                agility = 13;
                wisdom = 12;
                fortune = 9;
            }
            else if (race == "Satyr")
            {
                stamina = 12;
                might = 8;
                agility = 11;
                wisdom = 9;
                fortune = 13;
            }
            else if (race == "Cyclops")
            {
                stamina = 12;
                might = 14;
                agility = 8;
                wisdom = 7;
                fortune = 11;
            }
            else if (race == "Siren")
            {
                stamina = 8;
                might = 9;
                agility = 11;
                wisdom = 16;
                fortune = 15;
            }
            else if (race == "Dryad")
            {
                stamina = 8;
                might = 7;
                agility = 11;
                wisdom = 14;
                fortune = 12;
            }
            else if (race == "Empusae")
            {
                stamina = 10;
                might = 8;
                agility = 11;
                wisdom = 11;
                fortune = 10;
            }
            else
            {
                stamina = 7;
                might = 7;
                agility = 7;
                wisdom = 7;
                fortune = 7;
            }

            int totalPoints = stamina + might + agility + wisdom + fortune - softCap2;
            int startingLevel;
            if (totalPoints < 0)
                totalPoints = 0;
            if (totalPoints < 15)
                startingLevel = totalPoints / 3;
            else if (totalPoints > 25)
                startingLevel = totalPoints / 2;
            else
                startingLevel = totalPoints;
            int initialHealth = 100 + startingLevel * 10;

            if (wisdom < softCap1)
            {
                initialMana = 2 * wisdom;
            }
            else if (wisdom < softCap2)
            {
                initialMana = 40 + (wisdom - softCap1) * 1.5;
            }
            else
            {
                initialMana = 60 + (wisdom - softCap2) * 0.5;
            }

            return Character(name, race, max(startingLevel, 1), 0, initialHealth, stamina, might, agility, wisdom, fortune, initialMana);
        }


        Character player = createCharacter();

        cout << "Character Created!" << endl;
        player.displayStats();

        if (player.race == "Nymph")
        {
            cout << "Starting Equipment:" << endl;
            cout << "1. huntingBow:" << endl;
            cout << "2. rustedShiv" << endl;

            cout << "Abilities:" << endl;
            cout << "1. Enchanted Arrows: Infuse your arrows with magical energy, causing them to deal additional damage and apply a debuff to the target. (Cooldown: 4 turns, Duration: Debuff lasts for 3 turns)" << endl;
            cout << "2. Forest Cloak: Blend into your surroundings, becoming invisible to enemies and gaining increased evasion. (Cooldown: 5 turns, Duration: 3 turns of evasion boost)" << endl;
            cout << "3. Blessing of Regeneration: Once per battle, the character is granted a burst of healing energy, restoring a significant amount of health. Additionally, for the next 3 turns after using this ability, the character passively regenerates a small amount of health each turn." << endl;
        }
        else if (player.race == "Satyr")
        {
            cout << "Starting Equipment:" << endl;
            cout << "1. Vine Whip"<< endl;
            cout << "2. Thorned Vine Shield" << endl;

            cout << "Abilities:" << endl;
            cout << "1. Nature's Wrath: Unleash the fury of nature upon your enemies, dealing heavy damage to all foes in the vicinity. (Cooldown: 3 turns, Duration: Instantaneous)" << endl;
            cout << "2. Verdant Veil: Surround yourself with a protective barrier of nature's energy, reducing incoming damage and potentially providing healing over time. (Cooldown: 5 turns, Duration: 3 turns of damage reduction and potential healing)" << endl;
            cout << "3. Dionysian Spirit: Once per battle, invoke the spirit of Dionysus to gain a temporary boost to various attributes, such as increased agility, strength, and luck." << endl;
        }
        else if (player.race == "Olympian")
        {
            cout << "Starting Equipment:" << endl;
            cout << "1.sword." << endl;
            cout << "2. shield << endl;

            cout << "Abilities:" << endl;
            cout << "1. Zeus' Lightning: Call forth a bolt of lightning from the heavens to strike your enemies, dealing heavy damage. (Cooldown: 3 turns, Lasts: 1 turn)" << endl;
            cout << "2. Warrior's Endurance: Channel your inner strength to increase your stamina and defense, reducing damage taken. (Cooldown: 5 turns, Lasts: 3 turns)" << endl;
            cout << "3. Divine Protection: Surround yourself with divine energy, stunning nearby enemies and reducing their damage output. (Cooldown: 4 turns, Lasts: 1 turn)" << endl;
        }

        return 0;
    }
}
}