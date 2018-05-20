<?php

/**
 * AdDocumentDownloadTable
 *
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class AdDocumentDownloadTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object AdDocumentDownloadTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('AdDocumentDownload');
    }


    public function getListDocumentDownload($limit, $page, $cat = false)
    {
        $query = $this->createQuery()
            ->where('is_active=?', VtCommonEnum::NUMBER_ONE)
            ->orderBy('updated_at desc, priority asc');
        if ($cat) {
            $query->andWhere('category_id=?', $cat);
        }

        $pager = new sfDoctrinePager('AdDocumentDownload', $limit);
        $pager->setQuery($query);
        $pager->setPage($page);
        $pager->init();
        return $pager;
    }

    public function getListDocumentDownloadSearch($q, $limit = 10, $page = 1)
    {
        $query = $this->createQuery()
            ->where('is_active=?', VtCommonEnum::NUMBER_ONE)
            ->andWhere('LOWER(a.name) like LOWER(?) COLLATE utf8_bin', '%' . trim($q) . '%')
            ->orderBy('updated_at desc, priority asc');

        $pager = new sfDoctrinePager('AdDocumentDownload', $limit);
        $pager->setQuery($query);
        $pager->setPage($page);
        $pager->init();
        return $pager;
    }
}