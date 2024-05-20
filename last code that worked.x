#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

// Character class
class Character {
public:
    string name;
    string race;
    int level;
    int experience;
    int maxHealth;
    int health;
    int stamina; // Endurance
    int might; // Strength
    int nimble; // Agility
    int wisdom; // Intelligence
    int fortune; // Luck
    int mana; // Mana attribute

    // Constructor
    Character(const string& n, const string& r,
              int lvl, int exp, int maxHP, int hp,
              int st, int mi, int ni, int wi, int fo,
              int ma) // Adding mana parameter
        : name(n), race(r),
          level(lvl), experience(exp),
          maxHealth(maxHP), health(hp),
          stamina(st), might(mi),
          nimble(ni), wisdom(wi),
          fortune(fo), mana(ma) {}

    // Level up function
    void levelUp() {
        level++;
        maxHealth += 10;
        health = maxHealth;
    }

    // Allocate skill points with diminishing returns and hard cap
    void allocateSkillPoints(int stPoints, int miPoints, int niPoints, int wiPoints, int foPoints) {
        // Apply points to each attribute with diminishing returns and hard cap
        if (stPoints > 0) {
            if (stamina < 50) {
                if (stamina >= 35) {
                    stamina += max(stPoints / 4, 1); // Further diminished increase
                } else if (stamina >= 20) {
                    stamina += max(stPoints / 2, 1); // Diminished increase
                } else {
                    stamina += stPoints;
                }
                stamina = min(stamina, 50); // Hard cap
            }
        }
        if (miPoints > 0) {
            if (might < 50) {
                if (might >= 35) {
                    might += max(miPoints / 4, 1); // Further diminished increase
                } else if (might >= 20) {
                    might += max(miPoints / 2, 1); // Diminished increase
                } else {
                    might += miPoints;
                }
                might = min(might, 50); // Hard cap
            }
        }
        if (niPoints > 0) {
            if (nimble < 50) {
                if (nimble >= 35) {
                    nimble += max(niPoints / 4, 1); // Further diminished increase
                } else if (nimble >= 20) {
                    nimble += max(niPoints / 2, 1); // Diminished increase
                } else {
                    nimble += niPoints;
                }
                nimble = min(nimble, 50); // Hard cap
            }
        }
        if (wiPoints > 0) {
            if (wisdom < 50) {
                if (wisdom >= 35) {
                    wisdom += max(wiPoints / 4, 1); // Further diminished increase
                } else if (wisdom >= 20) {
                    wisdom += max(wiPoints / 2, 1); // Diminished increase
                } else {
                    wisdom += wiPoints;
                }
                wisdom = min(wisdom, 50); // Hard cap
            }
        }
        if (foPoints > 0) {
            if (fortune < 50) {
                if (fortune >= 35) {
                    fortune += max(foPoints / 4, 1); // Further diminished increase
                } else if (fortune >= 20) {
                    fortune += max(foPoints / 2, 1); // Diminished increase
                } else {
                    fortune += foPoints;
                }
                fortune = min(fortune, 50); // Hard cap
            }
        }

        // Adjust level based on total attribute points
        int totalPoints = stamina + might + nimble + wisdom + fortune - 35; // Subtract base attribute points (7 for each attribute)
        if (totalPoints < 0)
            totalPoints = 0;
        if (level < 15)
            level = totalPoints / 3; // Each additional 3 attribute points contributes to 1 level
        else if (level > 25)
            level = totalPoints / 2; // Each additional 2 attribute points contributes to 1 level

        // Ensure level is at least 1
        level = max(level, 1);
    }

    // Function to display character stats
    void displayStats() const {
        cout << "Name: " << name << endl;
        cout << "Race: " << race << endl;
        cout << "Level: " << level << endl;
        cout << "Experience: " << experience << endl;
        cout << "Health: " << health << "/" << maxHealth << endl;
        cout << "Stamina (Endurance): " << stamina << endl;
        cout << "Might (Strength): " << might << endl;
        cout << "Nimble (Agility): " << nimble << endl;
        cout << "Wisdom (Intelligence): " << wisdom << endl;
        cout << "Fortune (Luck): " << fortune << endl;
        cout << "Mana: " << mana << endl; // Display mana attribute
    }
};

// Function to handle race selection
string selectRace() {
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

    switch (choice) {
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

// Function to create a new character
Character createCharacter() {
    string name, race;
    cout << "Enter your character's name: ";
    cin >> name;

    // Select race
    race = selectRace();

    // Assign attributes based on race
    int stamina, might, nimble, wisdom, fortune;

    if (race == "Olympian") {
        stamina = 11;
        might = 14;
        nimble = 7;
        wisdom = 11;
        fortune = 8;
    } else if (race == "Nymph") {
        stamina = 7;
        might = 7;
        nimble = 13;
        wisdom = 12;
        fortune = 9;
    } else if (race == "Satyr") {
        stamina = 12;
        might = 8;
        nimble = 11;
        wisdom = 9;
        fortune = 13;
    } else if (race == "Cyclops") {
        stamina = 12;
        might = 14;
        nimble = 8;
        wisdom = 7;
        fortune = 11;
    } else if (race == "Siren") {
        stamina = 8;
        might = 9;
        nimble = 11;
        wisdom = 16;
        fortune = 15;
    } else if (race == "Dryad") {
        stamina = 8;
        might = 7;
        nimble = 11;
        wisdom = 14;
        fortune = 12;
    } else if (race == "Empusae") {
        stamina = 10;
        might = 8;
        nimble = 11;
        wisdom = 11;
        fortune = 10;
    } else {
        // Default to Mere Mortal
        stamina = 7;
        might = 7;
        nimble = 7;
        wisdom = 7;
        fortune = 7;
    }

    // Calculate initial mana based on wisdom level
    int initialMana = 2 * wisdom;

    // Calculate starting level based on attribute points
    int totalPoints = stamina + might + nimble + wisdom + fortune - 35; // Subtract base attribute points (7 for each attribute)
    int startingLevel;
    if (totalPoints < 0)
        totalPoints = 0;
    if (totalPoints < 15)
        startingLevel = totalPoints / 3; // Each additional 3 attribute points contributes to 1 level
    else if (totalPoints > 25)
        startingLevel = totalPoints / 2; // Each additional 2 attribute points contributes to 1 level
    else
        startingLevel = totalPoints; // Directly map attribute points to level

    // Calculate initial health based on starting level
    int initialHealth = 100 + startingLevel * 10;

    // Calculate initial mana based on wisdom level with soft caps
    if (wisdom < 20) {
        initialMana = 2 * wisdom; // Linear increase for wisdom < 20
    } else if (wisdom < 35) {
        initialMana = 40 + (wisdom - 20) * 1.5; // Slower increase for 20 <= wisdom < 35
    } else {
        initialMana = 60 + (wisdom - 35) * 0.5; // Even slower increase for wisdom >= 35
    }

    return Character(name, race, max(startingLevel, 1), 0, initialHealth, initialHealth, stamina, might, nimble, wisdom, fortune, initialMana);
}

int main() {
    // Create a new character
    Character player = createCharacter();

    // Display character stats
    cout << "Character Created!" << endl;
    player.displayStats();

    // Starting Equipment and Abilities based on race
    if (player.race == "Nymph") {
        cout << "Starting Equipment:" << endl;
        cout << "1. Floral Bow: A beautifully crafted bow adorned with floral motifs, it enhances the accuracy and power of the user's ranged attacks." << endl;
        cout << "2. Enchanted Circlet: A mystical circlet adorned with intricate nature-inspired runes, enhancing the wearer's magical abilities and providing protection against harmful effects." << endl;

        cout << "Abilities:" << endl;
        cout << "1. Enchanted Arrows: Infuse your arrows with magical energy, causing them to deal additional damage and apply a debuff to the target. (Cooldown: 4 turns, Duration: Debuff lasts for 3 turns)" << endl;
        cout << "2. Forest Cloak: Blend into your surroundings, becoming invisible to enemies and gaining increased evasion. (Cooldown: 5 turns, Duration: 3 turns of evasion boost)" << endl;
        cout << "3. Blessing of Regeneration: Once per battle, the character is granted a burst of healing energy, restoring a significant amount of health. Additionally, for the next 3 turns after using this ability, the character passively regenerates a small amount of health each turn." << endl;
    } else if (player.race == "Satyr") {
cout << "Starting Equipment:" << endl;
cout << "1. Vine Whip: A flexible whip made from enchanted vines, it can entangle enemies and restrain them in combat." << endl;
cout << "2. Thorned Vine Shield: A shield made from woven thorned vines, providing both defense and a chance to counterattack." << endl;

        cout << "Abilities:" << endl;
        cout << "1. Nature's Wrath: Unleash the fury of nature upon your enemies, dealing heavy damage to all foes in the vicinity. (Cooldown: 3 turns, Duration: Instantaneous)" << endl;
        cout << "2. Verdant Veil: Surround yourself with a protective barrier of nature's energy, reducing incoming damage and potentially providing healing over time. (Cooldown: 5 turns, Duration: 3 turns of damage reduction and potential healing)" << endl;
        cout << "3. Dionysian Spirit: Once per battle, invoke the spirit of Dionysus to gain a temporary boost to various attributes, such as increased agility, strength, and luck." << endl;
    } else if (player.race == "Olympian") {
        cout << "Starting Equipment:" << endl;
        cout << "1. Celestial Sword: A divine weapon bestowed upon Olympian warriors, capable of delivering powerful blows to enemies." << endl;
        cout << "2. Aegis Shield: An enchanted shield bearing the symbol of Olympus, providing exceptionheavensal defense against physical and magical attacks." << endl;

        cout << "Abilities:" << endl; 
        cout << "1. Zeus' Lightning: Call forth a bolt of lightning from the  to strike your enemies, dealing heavy damage. (Cooldown: 3 turns, Lasts: 1 turn)" << endl;

        cout << "Abilities:" << endl; 
        cout << "1. Zeus' Lightning: Call forth a bolt of lightning from the heavens to strike your enemies, dealing heavy damage. (Cooldown: 3 turns, Lasts: 1 turn)" << endl;
cout << "2. Warrior's Endurance: Channel your inner strength to increase your stamina and defense, reducing damage taken. (Cooldown: 5 turns, Lasts: 3 turns)" << endl;
        cout << "3. Divine Protection: Surround yourself with divine energy, stunning nearby enemies and reducing their damage output. (Cooldown: 4 turns, Lasts: 1 turn)" << endl;
    }

    return 0;

}