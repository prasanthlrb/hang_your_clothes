<?php
/*
 * This file is part of PHPUnit.
 *
 * (c) Sebastian Bergmann <sebastian@phpunit.de>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
use PHPUnit\Framework\TestCase;

class CoverageNotPublicTest extends TestCase
{
    /**
     * @covers CoveredClass::<!public>
     */
    public function testSomething(): void
    {
        $o = new CoveredClass;
        $o->publicMethod();
    }
}
