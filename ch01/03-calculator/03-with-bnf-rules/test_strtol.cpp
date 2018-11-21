#include <cmath>
#include <iostream>

int main() {
    std::cout << strtol("-0xff", NULL, 16) << std::endl;
    return 0;
}