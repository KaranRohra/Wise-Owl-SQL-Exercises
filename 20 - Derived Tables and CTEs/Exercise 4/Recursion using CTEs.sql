USE Carnival;
GO

WITH menus (MenuId, MenuName, BreadCrumb) AS (
    SELECT
        MenuId,
        MenuName,
        CAST('Top' AS varchar(100)) AS BreadCrumb
    FROM
        tblMenu
    WHERE
        ParentMenuId IS NULL

    UNION ALL

    SELECT
        submenu.MenuId,
        submenu.MenuName,
        CAST((menu.BreadCrumb + ' > ' + menu.MenuName) AS varchar(100)) AS Breadcrumb
    FROM
        tblMenu AS submenu
        INNER JOIN menus AS menu ON submenu.ParentMenuId = menu.MenuId
)

SELECT * FROM menus OPTION (MAXRECURSION 2);
