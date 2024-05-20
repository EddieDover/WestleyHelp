#include <string>
#include <cstdlib>
#include <ctime>

#include "../include/Character.h"

std::string askName() {
    std::string name = "";
    std::cout << "Enter your character's name: ";
    std::cin >> name;
    return name;
}

// Function to handle race selection
std::string askRace() {
    std::cout << "Choose your race:" << std::endl;
    std::cout << "1. Olympian" << std::endl;
    std::cout << "2. Nymph" << std::endl;
    std::cout << "3. Satyr" << std::endl;
    std::cout << "4. Cyclops" << std::endl;
    std::cout << "5. Siren" << std::endl;
    std::cout << "6. Dryad" << std::endl;
    std::cout << "7. Empusae" << std::endl;
    int choice;
    std::cin >> choice;

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
            std::cout << "Invalid choice. Defaulting to Mere Mortal." << std::endl;
            return "Mere Mortal";
    }
}

int main() {
    std::string name = askName();
    std::string race = askRace();
    // Create a new character
    Character player = Character::createCharacter(name, race);

    // Display character stats
    std::cout << "Character Created!" << std::endl;
    player.displayStats();

    // Starting Equipment and Abilities based on race
    if (player.race == "Nymph") {
        std::cout << "Starting Equipment:" << std::endl;
        std::cout << "1. Floral Bow: A beautifully crafted bow adorned with floral motifs, it enhances the accuracy and power of the user's ranged attacks." << std::endl;
        std::cout << "2. Enchanted Circlet: A mystical circlet adorned with intricate nature-inspired runes, enhancing the wearer's magical abilities and providing protection against harmful effects." << std::endl;

        std::cout << "Abilities:" << std::endl;
        std::cout << "1. Enchanted Arrows: Infuse your arrows with magical energy, causing them to deal additional damage and apply a debuff to the target. (Cooldown: 4 turns, Duration: Debuff lasts for 3 turns)" << std::endl;
        std::cout << "2. Forest Cloak: Blend into your surroundings, becoming invisible to enemies and gaining increased evasion. (Cooldown: 5 turns, Duration: 3 turns of evasion boost)" << std::endl;
        std::cout << "3. Blessing of Regeneration: Once per battle, the character is granted a burst of healing energy, restoring a significant amount of health. Additionally, for the next 3 turns after using this ability, the character passively regenerates a small amount of health each turn." << std::endl;
    } else if (player.race == "Satyr") {
        std::cout << "Starting Equipment:" << std::endl;
        std::cout << "1. Vine Whip: A flexible whip made from enchanted vines, it can entangle enemies and restrain them in combat." << std::endl;
        std::cout << "2. Thorned Vine Shield: A shield made from woven thorned vines, providing both defense and a chance to counterattack." << std::endl;

        std::cout << "Abilities:" << std::endl;
        std::cout << "1. Nature's Wrath: Unleash the fury of nature upon your enemies, dealing heavy damage to all foes in the vicinity. (Cooldown: 3 turns, Duration: Instantaneous)" << std::endl;
        std::cout << "2. Verdant Veil: Surround yourself with a protective barrier of nature's energy, reducing incoming damage and potentially providing healing over time. (Cooldown: 5 turns, Duration: 3 turns of damage reduction and potential healing)" << std::endl;
        std::cout << "3. Dionysian Spirit: Once per battle, invoke the spirit of Dionysus to gain a temporary boost to various attributes, such as increased agility, strength, and luck." << std::endl;
    } else if (player.race == "Olympian") {
        std::cout << "Starting Equipment:" << std::endl;
        std::cout << "1. Celestial Sword: A divine weapon bestowed upon Olympian warriors, capable of delivering powerful blows to enemies." << std::endl;
        std::cout << "2. Aegis Shield: An enchanted shield bearing the symbol of Olympus, providing exceptionheavensal defense against physical and magical attacks." << std::endl;

        std::cout << "Abilities:" << std::endl; 
        std::cout << "1. Zeus' Lightning: Call forth a bolt of lightning from the  to strike your enemies, dealing heavy damage. (Cooldown: 3 turns, Lasts: 1 turn)" << std::endl;

        std::cout << "Abilities:" << std::endl; 
        std::cout << "1. Zeus' Lightning: Call forth a bolt of lightning from the heavens to strike your enemies, dealing heavy damage. (Cooldown: 3 turns, Lasts: 1 turn)" << std::endl;
        std::cout << "2. Warrior's Endurance: Channel your inner strength to increase your stamina and defense, reducing damage taken. (Cooldown: 5 turns, Lasts: 3 turns)" << std::endl;
        std::cout << "3. Divine Protection: Surround yourself with divine energy, stunning nearby enemies and reducing their damage output. (Cooldown: 4 turns, Lasts: 1 turn)" << std::endl;
    }

    return 0;

}