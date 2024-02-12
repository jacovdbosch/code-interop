

typedef struct Person {
  const char *name;
} Person;

struct Person create_person(const char *name);

void print_person(struct Person person);
