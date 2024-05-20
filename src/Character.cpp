    #include "../include/Character.h"

    Character::Character(const std::string& name, const std::string& race,
            int level, int experience, int maxHealth, int health,
            int stamina, int might, int nimble, int wisdom, int fortune,
            int mana) // Adding mana parameter
            : name(name), race(race), level(level), experience(experience),
              maxHealth(maxHealth), health(health), stamina(stamina), might(might),
              nimble(nimble), wisdom(wisdom), fortune(fortune), mana(mana) {

            }
    // Level up function
    void Character::levelUp() {
        level++;
        maxHealth += 10;
        health = maxHealth;
    }

    // Allocate skill points with diminishing returns and hard cap
    void Character::allocateSkillPoints(int stPoints, int miPoints, int niPoints, int wiPoints, int foPoints) {
        // Apply points to each attribute with diminishing returns and hard cap
        if (stPoints > 0) {
            if (stamina < 50) {
                if (stamina >= 35) {
                    stamina += std::max(stPoints / 4, 1); // Further diminished increase
                } else if (stamina >= 20) {
                    stamina += std::max(stPoints / 2, 1); // Diminished increase
                } else {
                    stamina += stPoints;
                }
                stamina = std::min(stamina, 50); // Hard cap
            }
        }
        if (miPoints > 0) {
            if (might < 50) {
                if (might >= 35) {
                    might += std::max(miPoints / 4, 1); // Further diminished increase
                } else if (might >= 20) {
                    might += std::max(miPoints / 2, 1); // Diminished increase
                } else {
                    might += miPoints;
                }
                might = std::min(might, 50); // Hard cap
            }
        }
        if (niPoints > 0) {
            if (nimble < 50) {
                if (nimble >= 35) {
                    nimble += std::max(niPoints / 4, 1); // Further diminished increase
                } else if (nimble >= 20) {
                    nimble += std::max(niPoints / 2, 1); // Diminished increase
                } else {
                    nimble += niPoints;
                }
                nimble = std::min(nimble, 50); // Hard cap
            }
        }
        if (wiPoints > 0) {
            if (wisdom < 50) {
                if (wisdom >= 35) {
                    wisdom += std::max(wiPoints / 4, 1); // Further diminished increase
                } else if (wisdom >= 20) {
                    wisdom += std::max(wiPoints / 2, 1); // Diminished increase
                } else {
                    wisdom += wiPoints;
                }
                wisdom = std::min(wisdom, 50); // Hard cap
            }
        }
        if (foPoints > 0) {
            if (fortune < 50) {
                if (fortune >= 35) {
                    fortune += std::max(foPoints / 4, 1); // Further diminished increase
                } else if (fortune >= 20) {
                    fortune += std::max(foPoints / 2, 1); // Diminished increase
                } else {
                    fortune += foPoints;
                }
                fortune = std::min(fortune, 50); // Hard cap
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
        level = std::max(level, 1);
    }

    // Function to display character stats
    void Character::displayStats() const {
        std::cout << "Name: " << name << std::endl;
        std::cout << "Race: " << race << std::endl;
        std::cout << "Level: " << level << std::endl;
        std::cout << "Experience: " << experience << std::endl;
        std::cout << "Health: " << health << "/" << maxHealth << std::endl;
        std::cout << "Stamina (Endurance): " << stamina << std::endl;
        std::cout << "Might (Strength): " << might << std::endl;
        std::cout << "Nimble (Agility): " << nimble << std::endl;
        std::cout << "Wisdom (Intelligence): " << wisdom << std::endl;
        std::cout << "Fortune (Luck): " << fortune << std::endl;
        std::cout << "Mana: " << mana << std::endl; // Display mana attribute
    }