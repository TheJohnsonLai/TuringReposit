% Imports everything

import GUI
% Basic, required
include "LoadImages.t"
include "Variables.t"
include "Missions.t" %% Variables for Story/Sub/Exc
include "Equipment.t"
include "Skills.t"
include "Characters.t"
include "BattleHandling.t"

% Functions
include "BuildSkills.t"
include "CreateCharacters.t"
%include "LoadDialogue.t" % Word Wrap
include "WorldHandling.t" % Smooth handling, clicking, restriction

% Regions 
include "Battle.t"

%% Misc
include "Debug.t"
%include "LoadStory.t"
