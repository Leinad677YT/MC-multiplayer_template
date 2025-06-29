> [!WARNING]
> **BEFORE INSTALLING THIS LIBRARY, READ THIS DOCUMENTATION OR YOUR WORLD COULD BREAK FOREVER**

# Why is that warning on top of this header
You see, _I kinda forgot why this header was needed_.

**Now seriously,** there are a lot of technical aspects that get modified or influenced by this library, the biggest one being **player scoreboards getting reset whenever they disconnect**.

This can't be avoided because of the implementation of namechange detection the pack has, **but it comes with an advantage**.
Which leads us to the available functionality of the core library (this one)

## Content

There are **4** core aspects covered:
- World-exportable player databases
- Distinction on player scoreboards (temp/perm)
- Indivudual teams for players*
- Scheduled events manager **[WIP]**

#### Player databases and scoreboards
> To make easier "data saving" and gaining the ability to move data from 1 world to another, I had to assign the player scoreboards to their UUIDs instead if their names. This is because any namechange results in players keeping advancements, items and all data *except for scoreboards* which usually results in maps not being able to handle them.

That name->uuid change **requires** you to set which scores will get saved **for players** between sessions. Other entities do not require this to be set to keep saving their scores. 

Both of this mechanics can be managed in the _`db` function calls_

## What is a function call

In most of the documentation from now on, I'll refer to something I tend to name as **"function calls"**, these are user-aimed function tags, that get executed when a certain event happens, they cover aspects from default data for users to which scores get saved, as well as triggered events like a player death or a player inventory changing.

## User content
### Things that you can use/modify

Unless you won't need to update this library with a simple download from the web, I strongly encourage you to **not modify any module**. 
> [!NOTE] 
> Remember that you can use the relevant function calls by modifying the tag on an external datapack

You also have access to certain functions that can be useful to use 100% of the library capabilities.

### But, where are the things I have access to?

Everything that you can use, is inside the `l.user` namespace, **this holds true for any module**. Remember that the desired way to use it, is by 
- modifying the tags externally to use them
- calling the functions from outisde
- **not modifying the original files**

## How do I know what does everything do?

Inside their related function call folders or root folders, there should be a README file with all the info required to use that module. **DO NOT TRY TO REMOVE MODULES ON THIS PACK, THEY ARE ALL CORE MODULES AND DEPEND ON EACHOTHER**