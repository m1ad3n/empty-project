BUILD_DIR	=	./build
SOURCE_DIR	=	./src

CC			=	gcc
CFLAGS		=	-Wall -Wextra -w -g
LDFLAGS		=	
CXXFLAGS	=	

PROJECT		=	demo
TARGET		=	$(BUILD_DIR)/$(PROJECT)

SRCS		=	$(shell find . -name "*.c")
OBJS		=	$(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(basename $(notdir $(SRCS)))))
HEADERS		=	$(shell find . -name "*.h")

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c
	$(CC) $(CFLAGS) $(CXXFLAGS) -MMD -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS)

.PHONY: clean
clean:
	@rm -rvf $(BUILD_DIR)/**

-include $(wildcard $(BUILD_DIR)/*.d)
