#include <iostream>
union Un {
  int a;
  char b;
};

int main() {
  Un n;
  n.a = 12;

  std::cout << n.b << std::endl;
  return 0;
}
