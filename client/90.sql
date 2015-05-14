select p.strPath || f.strFilename
from files f
join path p
    on p.idPath = f.idPath
where f.playCount > 0;
