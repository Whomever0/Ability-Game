local EffectHandler = {}

local Remote: RemoteEvent = game:GetService'ReplicatedStorage'.Effect;
local ForceRemote: RemoteEvent = game:GetService'ReplicatedStorage'.Force;

local Players = game:GetService('Players');

function EffectHandler.PlayEffectFromPlayer(Player, Effect, State)
    for I,V in next, Players:GetPlayers() do
        if V ~= Player then
            Remote:FireClient(V, Effect, tostring(State):lower() == 'enabled' and 1 or 0, Player);
        end
    end
end

function EffectHandler.ApplyForce(Player, Force, Optional)
    ForceRemote:FireClient(Player, Force, Optional);
end

return EffectHandler;