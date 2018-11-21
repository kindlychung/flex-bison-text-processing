#include <unistd.h>
#include <csignal>
#include <iostream>

static int exit_flag = 0;

static void hdl(int sig) { exit_flag = 1; }

int main(int argc, char *argv[]) {
    struct sigaction act {};
    act.sa_handler = hdl;
    if (sigaction(SIGTERM, &act, NULL) < 0) {
        std::cerr << "sigaction failed."
                  << "\n";
        return 1;
    }
    while (!exit_flag)
        ;
    return 0;
}
