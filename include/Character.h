#ifndef CHARACTER_H
#define CHARACTER_H

#include <string>
#include <algorithm>
#include <iostream>

class Character {
    public:
        // Constructor
        Character(const std::string& name, const std::string& race,
            int level, int experience, int maxHealth, int health,
            int stamina, int might, int nimble, int wisdom, int fortune,
            int mana);

        // Function to create a new character
        static Character createCharacter(const std::string & name, const std::string & race) {

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
            int initialMana;

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

            return Character(name, race, std::max(startingLevel, 1), 0, initialHealth, initialHealth, stamina, might, nimble, wisdom, fortune, initialMana);
        }

        // Level up function
        void levelUp();

        // Allocate skill points with diminishing returns and hard cap
        void allocateSkillPoints(int stPoints, int miPoints, int niPoints, int wiPoints, int foPoints);

        // Function to display character stats
        void displayStats() const;
    public:
        std::string name;
        std::string race;
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
};

#endif